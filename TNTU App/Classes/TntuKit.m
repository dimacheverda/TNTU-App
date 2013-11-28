//
//  ScheduleParser.m
//  TNTU App
//
//  Created by Dima on 10/19/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "TntuKit.h"
#import "UIImageView+AFNetworking.h"

@implementation TntuKit

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
    return schedule;
}

#define DROPBOX_PREFIX @"https://dl.dropboxusercontent.com/u/100095175/TNTUData/"

+ (NSMutableArray *)loadArrayFromDropboxFile:(NSString *)aFilename
{
    NSURL *url = [NSURL URLWithString:[DROPBOX_PREFIX stringByAppendingString:aFilename]];
    NSMutableArray *result = [[NSMutableArray alloc] initWithContentsOfURL:url];
    return result;
}

+ (UIImage *)loadImageFromDropboxFile:(NSString *)aFilename
{
    NSURL *url = [NSURL URLWithString:[DROPBOX_PREFIX stringByAppendingString:aFilename]];
    UIImageView *result = [[UIImageView alloc] init];
    [result setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    return result.image;
}

+ (NSMutableDictionary *)loadDictionaryFromDropboxFile:(NSString *)aFilename
{
    NSURL *url = [NSURL URLWithString:[DROPBOX_PREFIX stringByAppendingString:aFilename]];
    NSMutableDictionary *result = [[NSMutableDictionary alloc] initWithContentsOfURL:url];
    return result;
}

@end
