//
//  NewsTableViewCell.m
//  TNTU App
//
//  Created by Dima on 10/15/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

- (void)drawRect:(CGRect)rect
{
    [self.newsImageView setClipsToBounds:YES];
    [self.newsImageView setContentMode:UIViewContentModeScaleAspectFill];
}

@end
