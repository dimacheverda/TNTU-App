//
//  ScheduleTableViewController.m
//  TNTU App
//
//  Created by Dima on 9/19/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "ScheduleTableViewController.h"
#import "ScheduleCell.h"

@interface ScheduleTableViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation ScheduleTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self initInfo];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initInfo];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)initInfo
{
    NSDictionary *subject1 = [NSDictionary dictionaryWithObjectsAndKeys:@"8:00", @"startTime", @"9:20", @"endTime", @"Lecture", @"classType", @"Matan", @"subjectName", @"K8-23", @"auditoryNumber", nil];
    NSDictionary *subject2 = [NSDictionary dictionaryWithObjectsAndKeys:@"9:30", @"startTime", @"10:50", @"endTime", @"Practice", @"classType", @"Українська мова за професійним спрямуванням", @"subjectName", @"K1-106", @"auditoryNumber", nil];
    NSDictionary *subject3 = [NSDictionary dictionaryWithObjectsAndKeys:@"11:10", @"startTime", @"12:30", @"endTime", @"Lecture", @"classType", @"Java", @"subjectName", @"K1-101", @"auditoryNumber", nil];
    NSDictionary *subject4 = [NSDictionary dictionaryWithObjectsAndKeys:@"13:00", @"startTime", @"14:20", @"endTime", @"Practice", @"classType", @"Philosophy", @"subjectName", @"K8-13", @"auditoryNumber", nil];
    NSDictionary *subject5 = [NSDictionary dictionaryWithObjectsAndKeys:@"14:40", @"startTime", @"16:00", @"endTime", @"Lecture", @"classType", @"History", @"subjectName", @"K2-86", @"auditoryNumber", nil];
    
    NSArray *day1 = [NSArray arrayWithObjects:subject1, subject3, subject4, subject5, nil];
    NSArray *day2 = [NSArray arrayWithObjects:subject3, subject4, subject5, nil];
    NSArray *day3 = [NSArray arrayWithObjects:subject2, subject4, nil];
    NSArray *day4 = [NSArray arrayWithObjects:subject4, subject5, nil];
    NSArray *day5 = [NSArray arrayWithObjects:subject2, subject3, subject4, nil];
    
    self.scheduleForFirstWeek = [NSArray arrayWithObjects:day1, day2, day3, day4, day5, nil];
    self.scheduleForSecondWeek = [NSArray arrayWithObjects:day2, day1, day5, day3, day4, nil];
}
- (IBAction)segmentedControlValueChanged:(id)sender
{
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//    if (self.segmentedControl.selectedSegmentIndex == 0) {
//        return [self.scheduleForFirstWeek count];
//    } else {
//        if (self.segmentedControl.selectedSegmentIndex == 1) {
//            return [self.scheduleForSecondWeek count];
//        }
//    }
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        return [[self.scheduleForFirstWeek objectAtIndex:section] count];
    } else {
        if (self.segmentedControl.selectedSegmentIndex == 1) {
            return [[self.scheduleForSecondWeek objectAtIndex:section] count];
        }
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ScheduleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSDictionary *subject = nil;
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        subject = [[self.scheduleForFirstWeek objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    } else subject = [[self.scheduleForSecondWeek objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    cell.startTimeLabel.text = [subject objectForKey:@"startTime"];
    cell.endTimeLabel.text = [subject objectForKey:@"endTime"];
    cell.classTypeLabel.text = [subject objectForKey:@"classType"];
    cell.subjectNameLabel.text = [subject objectForKey:@"subjectName"];
    cell.auditoryNumberLabel.text = [subject objectForKey:@"auditoryNumber"];
    
    CGRect frame = CGRectMake(60.0, 0.0, 1.0, cell.contentView.frame.size.height - 0.0);
    UIView *separator1 = [[UIView alloc] initWithFrame:frame];
    separator1.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:separator1];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *days = [NSArray arrayWithObjects:@"Понеділок", @"Вівторок", @"Середа", @"Четвер", @"Пятниця", nil];
    
    return [days objectAtIndex:section];
}

@end