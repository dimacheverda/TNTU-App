//
//  NewsSecondaryTableViewController.m
//  TNTU App
//
//  Created by Dima on 9/16/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "NewsSecondaryTableViewController.h"

@interface NewsSecondaryTableViewController ()
{
    NSString *selectedTitle;
}

@end

@implementation NewsSecondaryTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.contentArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedTitle = [self.contentArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"Show Article" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Show Article"]) {
        [[segue.destinationViewController navigationItem] setTitle:selectedTitle];
    }
}

@end
