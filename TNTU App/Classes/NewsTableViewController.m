//
//  NewsTableViewController.m
//  TNTU App
//
//  Created by Dima on 10/15/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsTableViewCell.h"

@interface NewsTableViewController ()

@end

@implementation NewsTableViewController

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (NewsTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
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
}

@end
