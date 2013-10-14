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

@interface PopoverTableViewController () <WYPopoverControllerDelegate>

@end

@implementation PopoverTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [(ScheduleTableViewController *)self.navigationController.parentViewController setCurrentGroupName:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    
}

- (BOOL)popoverControllerShouldDismissPopover:(WYPopoverController *)controller
{
    return YES;
}


@end
