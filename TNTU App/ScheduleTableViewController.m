//
//  ScheduleTableViewController.m
//  TNTU App
//
//  Created by Dima on 9/19/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "ScheduleTableViewController.h"
#import "ScheduleSingleCell.h"
#import "ScheduleDoubleCell.h"

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
    [self scrollToCurrentWeekDay];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)scrollToCurrentWeekDay
{
    NSDate *today = [NSDate date];
    NSDateFormatter *myFormatter = [[NSDateFormatter alloc] init];
    [myFormatter setDateFormat:@"EEEE"]; // day, like "Saturday"
    [myFormatter setDateFormat:@"c"]; // day number, like 7 for saturday
    
    NSString *dayOfWeek = [myFormatter stringFromDate:today];
    NSInteger day = [dayOfWeek intValue];
    NSLog(@"%@", dayOfWeek);
    if (day > 5) {
        day = 1;
    }
    
//    NSLog(@"Today is: %@", dayOfWeek);
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:(day - 1)];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)initInfo
{
    NSDictionary *subject1 = [NSDictionary dictionaryWithObjectsAndKeys:@"8:00", @"startTime", @"9:20", @"endTime", @"Lecture", @"classType", @"Matan", @"subjectName", @"K8-23", @"auditoryNumber", nil];
    NSDictionary *subject2 = [NSDictionary dictionaryWithObjectsAndKeys:@"9:30", @"startTime", @"10:50", @"endTime", @"Practice", @"classType", @"Українська мова за професійним спрямуванням", @"subjectName", @"K1-106", @"auditoryNumber", nil];
    NSDictionary *subject3 = [NSDictionary dictionaryWithObjectsAndKeys:@"11:10", @"startTime", @"12:30", @"endTime", @"Lecture", @"classType", @"Java", @"subjectName", @"K1-101", @"auditoryNumber", nil];
    NSDictionary *subject4 = [NSDictionary dictionaryWithObjectsAndKeys:@"13:00", @"startTime", @"14:20", @"endTime", @"Practice", @"classType", @"Philosophy", @"subjectName", @"K8-13", @"auditoryNumber", nil];
    NSDictionary *subject5 = [NSDictionary dictionaryWithObjectsAndKeys:@"14:40", @"startTime", @"16:00", @"endTime", @"Lecture", @"classType", @"History", @"subjectName", @"K2-86", @"auditoryNumber", nil];
    
    NSArray *class1 = [NSArray arrayWithObjects:subject1, nil];
    NSArray *class2 = [NSArray arrayWithObjects:subject1, subject3, nil];
    NSArray *class3 = [NSArray arrayWithObjects:subject2, nil];
    NSArray *class4 = [NSArray arrayWithObjects:subject2, subject5, nil];
    NSArray *class5 = [NSArray arrayWithObjects:subject3, subject4, nil];
    
//    NSArray *day1 = [NSArray arrayWithObjects:subject1, subject3, subject4, subject5, nil];
//    NSArray *day2 = [NSArray arrayWithObjects:subject3, subject4, subject5, nil];
//    NSArray *day3 = [NSArray arrayWithObjects:subject2, subject4, nil];
//    NSArray *day4 = [NSArray arrayWithObjects:subject4, subject5, nil];
//    NSArray *day5 = [NSArray arrayWithObjects:subject2, subject3, subject4, nil];
    
    NSArray *day1 = [NSArray arrayWithObjects:class1, class5, nil];
    NSArray *day2 = [NSArray arrayWithObjects:class2, class3, class4, class5, nil];
    NSArray *day3 = [NSArray arrayWithObjects:class1, class4, class5, nil];
    NSArray *day4 = [NSArray arrayWithObjects:class1, class2, class3,class5, nil];
    NSArray *day5 = [NSArray arrayWithObjects:class3, class4, class5, nil];
    
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
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        return [self.scheduleForFirstWeek count];
    } else {
        if (self.segmentedControl.selectedSegmentIndex == 1) {
            return [self.scheduleForSecondWeek count];
        }
    }
    return 0;
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
    static NSString *SingleCellIdentifier = @"Single Cell";
    static NSString *DoubleCellIdentifier = @"Double Cell";
    
    NSArray *class = nil;
    UITableViewCell *cell = nil;
    
    // checking witch week schedule to load
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        class = [[self.scheduleForFirstWeek objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    } else class = [[self.scheduleForSecondWeek objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    if ([class count] == 1) {
        ScheduleSingleCell *singleCell = [tableView dequeueReusableCellWithIdentifier:SingleCellIdentifier forIndexPath:indexPath];
        NSDictionary *subject = [class objectAtIndex:0];
        
        // filling data for single schedule cell
        singleCell.startTimeLabel.text = [subject objectForKey:@"startTime"];
        singleCell.endTimeLabel.text = [subject objectForKey:@"endTime"];
        singleCell.classTypeLabel.text = [subject objectForKey:@"classType"];
        singleCell.subjectNameLabel.text = [subject objectForKey:@"subjectName"];
        singleCell.auditoryNumberLabel.text = [subject objectForKey:@"auditoryNumber"];

        cell = singleCell;
//        return singleCell;
    } else if ([class count] == 2) {
        ScheduleDoubleCell *doubleCell = [tableView dequeueReusableCellWithIdentifier:DoubleCellIdentifier forIndexPath:indexPath];
        NSDictionary *firstSubject = [class objectAtIndex:0];
        NSDictionary *secondSubject = [class objectAtIndex:1];
        
        doubleCell.startTimeLabel.text = [firstSubject objectForKey:@"startTime"];
        doubleCell.endTimeLabel.text = [firstSubject objectForKey:@"endTime"];
        
        doubleCell.firstClassTypeLabel.text = [firstSubject objectForKey:@"classType"];
        doubleCell.firstSubjectNameLabel.text = [firstSubject objectForKey:@"subjectName"];
        doubleCell.firstAuditoryNumberLabel.text = [firstSubject objectForKey:@"auditoryNumber"];
        doubleCell.secondClassTypeLabel.text = [secondSubject objectForKey:@"classType"];
        doubleCell.secondSubjectNameLabel.text = [secondSubject objectForKey:@"subjectName"];
        doubleCell.secondAuditoryNumberLabel.text = [secondSubject objectForKey:@"auditoryNumber"];
    
        //horizontal separator
        CGRect frame = CGRectMake(70.0, 82.0, 243.0, 1.0);
        UIView *horizontalSeparator = [[UIView alloc] initWithFrame:frame];
        horizontalSeparator.backgroundColor = [UIColor lightGrayColor];
        [doubleCell.contentView addSubview:horizontalSeparator];
        
        
        cell = doubleCell;
//        return doubleCell;
    }
    
    // vertical separator
    CGRect frame = CGRectMake(60.0, 0.0, 1.0, cell.contentView.frame.size.height - 0.0);
    UIView *verticalSeparator = [[UIView alloc] initWithFrame:frame];
    verticalSeparator.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:verticalSeparator];
    
    
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *days = [NSArray arrayWithObjects:@"Понеділок", @"Вівторок", @"Середа", @"Четвер", @"Пятниця", nil];
    
    return [days objectAtIndex:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *class;
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        class = [[self.scheduleForFirstWeek objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    } else class = [[self.scheduleForSecondWeek objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    if ([class count] == 1) {
        return 82.0;
    } else
        return 164.0;
}

@end