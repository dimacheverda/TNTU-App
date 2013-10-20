//
//  GroupsTableViewController.m
//  TNTU App
//
//  Created by Dima on 9/16/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "GroupsTableViewController.h"
#import "ScheduleTableViewController.h"
#import "ScheduleLoader.h"

@interface GroupsTableViewController ()
{
    NSDictionary *schedule;
}

@property (strong, nonatomic) NSArray *allGroups;

@end

@implementation GroupsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *fis1 = [NSArray arrayWithObjects:@"СБ-11", @"СІ-11", @"СН-11", @"СН-12", @"СП-11", nil];
    NSArray *fis2 = [NSArray arrayWithObjects:@"СБ-21", @"СІ-21", @"СН-21", @"СП-21", nil];
    NSArray *fis3 = [NSArray arrayWithObjects:@"СІ-31", @"СІс-31", @"СН-31", @"СНс-31", @"СП-31", @"СПс-31", nil];
    NSArray *fis4 = [NSArray arrayWithObjects:@"СІ-41", @"СІ-42", @"СН-41", @"СНс-41", @"СНс-42", @"СП-41", nil];
    
    self.allGroups = [NSArray arrayWithObjects:fis1, fis2, fis3, fis4, nil];
    
    schedule = [ScheduleLoader loadScheduleFromMainBundle];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.allGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        NSArray *temp = [self.allGroups objectAtIndex:0];
        return temp.count;
    }
    if (section == 1) {
        NSArray *temp = [self.allGroups objectAtIndex:1];
        return temp.count;
    }
    if (section == 2) {
        NSArray *temp = [self.allGroups objectAtIndex:2];
        return temp.count;
    }
    if (section == 3) {
        NSArray *temp = [self.allGroups objectAtIndex:3];
        return temp.count;
    }
    if (section == 4) {
        NSArray *temp = [self.allGroups objectAtIndex:4];
        return temp.count;
    }
    if (section == 5) {
        NSArray *temp = [self.allGroups objectAtIndex:5];
        return temp.count;
    }
    if (section == 6) {
        NSArray *temp = [self.allGroups objectAtIndex:6];
        return temp.count;
    }
    if (section == 7) {
        NSArray *temp = [self.allGroups objectAtIndex:7];
        return temp.count;
    } else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSArray *temp = [self.allGroups objectAtIndex:indexPath.section];
    
    cell.textLabel.text = [temp objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *yearsArray = @[@"1 курс",@"2 курс",@"3 курс",@"4 курс",@"5 курс"];
    
    return [yearsArray objectAtIndex:section];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Show Schedule"]) {
        UITableViewCell *cell = sender;
        [[segue.destinationViewController navigationItem] setTitle:cell.textLabel.text];
        
        [segue.destinationViewController setScheduleForFirstWeek:[schedule objectForKey:cell.textLabel.text][0]];
        [segue.destinationViewController setScheduleForSecondWeek:[schedule objectForKey:cell.textLabel.text][1]];
//        [segue.destinationViewController setScheduleForFirstWeek:[schedule objectForKey:@"СП-21"][0]];
//        [segue.destinationViewController setScheduleForSecondWeek:[schedule objectForKey:@"СП-21"][1]];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
}

@end
