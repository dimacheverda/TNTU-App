//
//  PopoverTableViewController.m
//  TNTU App
//
//  Created by Dima on 10/13/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "PopoverTableViewController.h"
#import "ScheduleTableViewController.h"
#import "WYPopoverController.h"

@interface PopoverTableViewController ()
{
    NSString *groupName;
}

@end

@implementation PopoverTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.groupNumber inSection:0];
    [[self.tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    groupName = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    [self.delegate popoverTableViewController:self didSelectGroupName:groupName];
}

@end
