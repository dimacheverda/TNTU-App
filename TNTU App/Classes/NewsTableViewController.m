//
//  NewsTableViewController.m
//  TNTU App
//
//  Created by Dima on 10/15/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsTableViewCell.h"
#import "EmptyNewsCell.h"
#import "NewsViewController.h"
#import "TntuKit.h"
#import "UIImageView+AFNetworking.h"
#import "Reachability.h"
#import "MBProgressHUD.h"

@interface NewsTableViewController () <MBProgressHUDDelegate>

@property (nonatomic) BOOL isDataLoaded;
@property (nonatomic) NSInteger selectedCellIndex;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) MBProgressHUD *HUD;

@end

@implementation NewsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.isDataLoaded = NO;
    
    // Initializing refresh control
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshControlToggled) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
    
    // Init MBProgressHUD
    self.HUD = [[MBProgressHUD alloc] initWithView:self.tableView];
    [self.tableView addSubview:self.HUD];
    
    // Loading data in background thread and reloading table view data source
    [self refreshControlToggled];
}

- (void)refreshControlToggled
{
    // Allocate a reachability object
    Reachability* reach = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    // Set the blocks
    reach.reachableBlock = ^(Reachability*reach)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
            
            // Showing HUD
            dispatch_async(dispatch_get_main_queue(), ^{
            
                // Set custom view mode
                self.HUD.mode = MBProgressHUDModeIndeterminate;
                self.HUD.delegate = self;
                self.HUD.labelText = @"Loading";
                
                [self.HUD show:YES];
            });
            
            // Loading array fomr internet
            self.tableViewDataArray = [TntuKit loadArrayFromDropboxFile:@"newsbase.plist"];
            
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            
            // Hiding HUD
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.HUD hide:YES];
            });
            
            if (self.tableViewDataArray != nil) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.isDataLoaded = YES;
                    [self.tableView reloadData];
                    [self.refreshControl endRefreshing];
                });
            }
        });
    };
    
    reach.unreachableBlock = ^(Reachability*reach)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.refreshControl endRefreshing];
            
            // Set custom view mode
            self.HUD.mode = MBProgressHUDModeCustomView;
            self.HUD.delegate = self;
            self.HUD.labelText = @"No Network Connection";
            
            [self.HUD show:YES];
            [self.HUD hide:YES afterDelay:1.5];
        });
    };
    
    // Start the notifier, which will cause the reachability object to retain itself!
    [reach startNotifier];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isDataLoaded) {
        return [self.tableViewDataArray count];
    } else return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isDataLoaded) {
        static NSString *CellIdentifier = @"News Cell";
        NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        NSDictionary *currentNews = [NSDictionary dictionaryWithDictionary:[self.tableViewDataArray objectAtIndex:indexPath.row]];
        
        cell.titleLabel.text = [currentNews objectForKey:@"title"];
        NSURL *url = [NSURL URLWithString:[[currentNews objectForKey:@"images"] objectAtIndex:0]];
        [cell.newsImageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        return cell;
    } else {
        static NSString *CellIdentifier = @"Empty News Cell";
        EmptyNewsCell *emptyCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        return emptyCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedCellIndex = indexPath.row;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"Cell Selected" sender:self];
}

#pragma mark Segue preparation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSDictionary *currentNews = [NSDictionary dictionaryWithDictionary:[self.tableViewDataArray objectAtIndex:self.selectedCellIndex]];
    [segue.destinationViewController setTitleString:[currentNews objectForKey:@"title"]];
    [segue.destinationViewController setContentString:[currentNews objectForKey:@"content"]];
    [segue.destinationViewController setImagesNameArray:[currentNews objectForKey:@"images"]];
}

@end
