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
#import "TntuKit.h"

@interface NewsTableViewController ()

@property BOOL isDataLoaded;

@end

@implementation NewsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.isDataLoaded = NO;
    // Loading data in background thread and reloading table view data source
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.tableViewDataArray = [TntuKit loadArrayFromDropboxFile:@"newsbase.plist"];
        NSLog(@"%@", self.tableViewDataArray);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.isDataLoaded = YES;
            [self.tableView reloadData];
            
            
            
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
        
        NSArray *days = [NSArray arrayWithObjects:
                         @"На базі ТНТУ відбувся І етап Всеукраїнської студентської олімпіади з програмування у Тернопільській області",
                         @"Міжнародний симпозіум Програм подвійних дипломів магістрів",
                         @"Візит делегації Мережі Вищих Інженерних Шкіл Франції «n+i»",
                         @"На базі ТНТУ відбувся І етап Всеукраїнської студентської олімпіади з програмування у Тернопільській області",
                         @"Міжнародний симпозіум Програм подвійних дипломів магістрів",
                         @"Візит делегації Мережі Вищих Інженерних Шкіл Франції «n+i»",
                         @"На базі ТНТУ відбувся І етап Всеукраїнської студентської олімпіади з програмування у Тернопільській області",
                         @"Міжнародний симпозіум Програм подвійних дипломів магістрів",
                         @"Візит делегації Мережі Вищих Інженерних Шкіл Франції «n+i»",
                         @"На базі ТНТУ відбувся І етап Всеукраїнської студентської олімпіади з програмування у Тернопільській області",
                         @"Міжнародний симпозіум Програм подвійних дипломів магістрів",
                         @"Візит делегації Мережі Вищих Інженерних Шкіл Франції «n+i»",
                         @"На базі ТНТУ відбувся І етап Всеукраїнської студентської олімпіади з програмування у Тернопільській області",
                         @"Міжнародний симпозіум Програм подвійних дипломів магістрів",
                         @"Візит делегації Мережі Вищих Інженерних Шкіл Франції «n+i»", nil];
        cell.titleLabel.text = [days objectAtIndex:indexPath.row];
        cell.newsImageView.image = [UIImage imageNamed:@"placeholder"];
        return cell;
    } else {
        static NSString *CellIdentifier = @"Empty News Cell";
        EmptyNewsCell *emptyCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        return emptyCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
