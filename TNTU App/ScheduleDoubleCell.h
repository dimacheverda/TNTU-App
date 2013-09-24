//
//  ScheduleDoubleCell.h
//  TNTU App
//
//  Created by Dima on 9/24/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleDoubleCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstClassTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstSubjectNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstAuditoryNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondClassTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondSubjectNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondAuditoryNumberLabel;

@end
