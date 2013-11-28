//
//  UIColor+TNTU_Additions.m
//  TNTU App
//
//  Created by Dima on 10/27/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "UIColor+TNTUAdditions.h"

@implementation UIColor (TNTUAdditions)

+ (UIColor *)tntuLightBlueColor
{
    return [self colorWithRed:52.0/255.0 green:152.0/255.0 blue:219.0/255.0 alpha:1.0];
}

+ (UIColor *)tntuLightGrayColor
{
    return [self colorWithRed:236.0/255.0 green:240.0/255.0 blue:241.0/255.0 alpha:1.0];
}

+ (UIColor *)tntuArticleTextColor
{
    return [UIColor colorWithRed:38.0/255.0 green:38.0/255.0 blue:38.0/255.0 alpha:1.0];
}

+ (UIColor *)tntuArticleBackgroundColor
{
    return [UIColor colorWithRed:249.0/255.0 green:249.0/255.0 blue:249.0/255.0 alpha:1.0];
//    return [UIColor groupTableViewBackgroundColor];
}

@end
