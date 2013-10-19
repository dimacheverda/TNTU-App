//
//  ScheduleTableViewController.m
//  TNTU App
//
//  Created by Dima on 9/19/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "ScheduleTableViewController.h"
#import "ScheduleSingleCell.h"
//#import "ScheduleDoubleCell.h"
#import "PopoverTableViewController.h"
#import "WYPopoverController.h"
#import "WYStoryboardPopoverSegue.h"

@interface ScheduleTableViewController () <WYPopoverControllerDelegate, PopoverTableViewControllerDelegate>
{
    WYPopoverController *popoverController;
}

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation ScheduleTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self segmentedControlValueChanged];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)scrollToCurrentWeekDayTableView:(UITableView *)tableView
{
    NSDate *today = [NSDate date];
    NSDateFormatter *myFormatter = [[NSDateFormatter alloc] init];
    [myFormatter setDateFormat:@"EEEE"]; // day, like "Saturday"
    [myFormatter setDateFormat:@"c"]; // day number, like 7 for saturday

    NSInteger day = [[myFormatter stringFromDate:today] intValue];
    if (day > 5) {
        day = 1;
    }
    day--;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:day];
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop
                             animated:NO];
    [tableView reloadData];
//    NSLog(@"section:%d   row:%d", indexPath.section, indexPath.row);
//    NSLog(@"Today is: %d day of the week", day+1);
}

- (IBAction)segmentedControlValueChanged
{
    [self.tableView reloadData];
//    [self scrollToCurrentWeekDayTableView:self.tableView];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Popover Segue"])
    {
        WYStoryboardPopoverSegue *popoverSegue = (WYStoryboardPopoverSegue*)segue;
        PopoverTableViewController *popoverTableViewController = segue.destinationViewController;
        popoverTableViewController.preferredContentSize = CGSizeMake(280, 88);
        popoverTableViewController.delegate = self;
        [popoverTableViewController setGroupNumber:self.groupNumber];
        popoverController = [popoverSegue popoverControllerWithSender:sender permittedArrowDirections:WYPopoverArrowDirectionAny animated:YES];
        popoverController.delegate = self;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        return [[[self.scheduleForFirstWeek objectAtIndex:section] objectAtIndex:self.groupNumber] count];
    } else {
        if (self.segmentedControl.selectedSegmentIndex == 1) {
            return [[[self.scheduleForSecondWeek objectAtIndex:section] objectAtIndex:self.groupNumber] count];
        }
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SingleCellIdentifier = @"Single Cell";
    
    NSDictionary *subject = nil;
    UITableViewCell *cell = nil;
    
    // checking which week schedule to load
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        subject = [[[self.scheduleForFirstWeek objectAtIndex:indexPath.section] objectAtIndex:self.groupNumber] objectAtIndex:indexPath.row];
    } else
        subject = [[[self.scheduleForSecondWeek objectAtIndex:indexPath.section] objectAtIndex:self.groupNumber] objectAtIndex:indexPath.row];
    
        ScheduleSingleCell *singleCell = [tableView dequeueReusableCellWithIdentifier:SingleCellIdentifier forIndexPath:indexPath];
        
        // filling data for single schedule cell
        singleCell.startTimeLabel.text = [subject objectForKey:@"startTime"];
        singleCell.endTimeLabel.text = [subject objectForKey:@"endTime"];
        singleCell.classTypeLabel.text = [subject objectForKey:@"classType"];
        singleCell.subjectNameLabel.text = [subject objectForKey:@"subjectName"];
        singleCell.auditoryNumberLabel.text = [subject objectForKey:@"auditoryNumber"];

        cell = singleCell;
    
    // vertical separator
    CGRect frame = CGRectMake(60.0, 0.0, 1.0, cell.contentView.frame.size.height - 0.0);
    UIView *verticalSeparator = [[UIView alloc] initWithFrame:frame];
    verticalSeparator.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:verticalSeparator];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *days = [NSArray arrayWithObjects:@"Понеділок", @"Вівторок", @"Середа", @"Четвер", @"Пятниця", nil];
    
    return [days objectAtIndex:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
}

#pragma mark - WYPopoverControllerDelegate

- (BOOL)popoverControllerShouldDismissPopover:(WYPopoverController *)aPopoverController
{
//    NSLog(@"should dismiss");
    return YES;
}

- (void)popoverControllerDidDismissPopover:(WYPopoverController *)aPopoverController
{
//    NSLog(@"did dismiss");
    popoverController.delegate = nil;
    popoverController = nil;
}

#pragma mark - PopoverTableViewControllerDelegate

- (void)popoverTableViewController:(PopoverTableViewController *)controller didSelectGroupName:(NSString *)groupName
{
//    NSLog(@"group name: %@", groupName);
    [self.groupNameBarButtonItem setTitle:groupName];
    if ([groupName isEqualToString:@"1 група"]) {
        self.groupNumber = 0;
    } else
        self.groupNumber = 1;
    controller.delegate = nil;
    [popoverController dismissPopoverAnimated:YES];
    popoverController.delegate = nil;
    popoverController = nil;
    
    [self.tableView reloadData];
//    [self scrollToCurrentWeekDayTableView:self.tableView];
}

@end