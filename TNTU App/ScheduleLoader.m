//
//  ScheduleParser.m
//  TNTU App
//
//  Created by Dima on 10/19/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "ScheduleLoader.h"

@implementation ScheduleLoader

+ (NSDictionary *)loadScheduleFromMainBundle
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"schedule" ofType:@"plist"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSPropertyListFormat format;
    NSString *errorDesc = nil;
    NSDictionary *schedule = (NSDictionary *)[NSPropertyListSerialization
                                propertyListFromData:data
                                mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                format:&format
                                errorDescription:&errorDesc];
//    NSLog(@"%@", schedule);
    return schedule;
}

@end
