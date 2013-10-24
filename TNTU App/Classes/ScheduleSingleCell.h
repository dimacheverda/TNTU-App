//
//  ScheduleCell.h
//  TNTU App
//
//  Created by Dima on 9/19/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleSingleCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *classTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *subjectNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *auditoryNumberLabel;

@end
