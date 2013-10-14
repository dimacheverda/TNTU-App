//
//  ScheduleTableViewController.h
//  TNTU App
//
//  Created by Dima on 9/19/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *scheduleForFirstWeek;
@property (strong, nonatomic) NSArray *scheduleForSecondWeek;

@property (strong, nonatomic) NSString* currentGroupName;

@end
