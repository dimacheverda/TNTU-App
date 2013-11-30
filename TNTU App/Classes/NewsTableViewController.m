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

@interface NewsTableViewController ()

@property (nonatomic) BOOL isDataLoaded;
@property (nonatomic) NSInteger selectedCellIndex;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

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
    
    // Loading data in background thread and reloading table view data source
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.tableViewDataArray = [TntuKit loadArrayFromDropboxFile:@"newsbase.plist"];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.isDataLoaded = YES;
            [self.tableView reloadData];
        });
    });
}

- (void)refreshControlToggled
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.tableViewDataArray = [TntuKit loadArrayFromDropboxFile:@"newsbase.plist"];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.isDataLoaded = YES;
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
        });
    });
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
