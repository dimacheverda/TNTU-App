//
//  ScheduleCell.m
//  TNTU App
//
//  Created by Dima on 9/19/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "ScheduleSingleCell.h"

@implementation ScheduleSingleCell

 - (void)drawRect:(CGRect)rect
{
    // Draw vertical separator
    CGRect frame = CGRectMake(60.0, 0.0, 1.0, self.contentView.frame.size.height - 0.0);
    UIView *verticalSeparator = [[UIView alloc] initWithFrame:frame];
    verticalSeparator.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:verticalSeparator];
}

@end
