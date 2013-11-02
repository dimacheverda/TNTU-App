//
//  UIFont+TNTUAdditions.m
//  TNTU App
//
//  Created by Dima on 10/31/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "UIFont+TNTUAdditions.h"

@implementation UIFont (TNTUAdditions)

+ (UIFont *)fontForArticleContent
{
    UIFontDescriptor *fontDesc = [UIFontDescriptor fontDescriptorWithFontAttributes:@{UIFontDescriptorFamilyAttribute : @"Georgia"}];
    UIFont *font = [UIFont fontWithDescriptor:fontDesc size:16.0];
    return font;
}

@end
