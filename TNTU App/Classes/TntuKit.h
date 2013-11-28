//
//  ScheduleParser.h
//  TNTU App
//
//  Created by Dima on 10/19/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TntuKit : NSObject

+ (NSDictionary *)loadScheduleFromMainBundle;
+ (NSMutableArray *)loadArrayFromDropboxFile:(NSString *)aFilename;
+ (UIImage *)loadImageFromDropboxFile:(NSString *)aFilename;
+ (NSMutableDictionary *)loadDictionaryFromDropboxFile:(NSString *)aFilename;

@end
