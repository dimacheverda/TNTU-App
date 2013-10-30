//
//  TntuDesignKit.m
//  TNTU App
//
//  Created by Dima on 10/28/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "TntuDesignKit.h"

@implementation TntuDesignKit

+ (UIFont *)fontForArticleContent
{
    UIFontDescriptor *fontDesc = [UIFontDescriptor fontDescriptorWithFontAttributes:@{UIFontDescriptorFamilyAttribute : @"Georgia"}];
    UIFont *font = [UIFont fontWithDescriptor:fontDesc size:16.0];
    return font;
}

+ (CGRect)frameForTitleLabel:(UILabel *)titleLabel
{
    CGSize size = [titleLabel.text sizeWithAttributes:@{NSFontAttributeName: titleLabel.font,
                                                        UIFontDescriptorTraitsAttribute: @(UIFontDescriptorTraitBold)}];
    CGRect rect = CGRectMake(0.0, 2.0, size.width, size.height);
    return rect;
}

static CGFloat kImageViewHeight = 14*9;
static CGFloat kImageViewWidth = 160;
static CGFloat kImageViewPadding = 30*14;

+ (NSMutableArray *)addImageViews:(NSArray *)imageViewsArray toTextView:(UITextView *)textView
{
    NSInteger currentImageView = 0;
    NSMutableArray *exclusionPaths = [NSMutableArray new];
    for (UIImageView *imageView in imageViewsArray) {
        CGRect frame = CGRectMake((currentImageView % 2) * 160.0,
                                  kImageViewPadding * currentImageView + kImageViewHeight,
                                  kImageViewWidth,
                                  kImageViewHeight);
        imageView.frame = frame;
        UIBezierPath* exclusionPath = [UIBezierPath bezierPathWithRect:CGRectMake(imageView.frame.origin.x - 3.0,
                                                                                  imageView.frame.origin.y - 10.0,
                                                                                  imageView.frame.size.width + 3.0,
                                                                                  imageView.frame.size.height + 10.0)];
        [exclusionPaths addObject:exclusionPath];
        [textView addSubview:imageView];
        currentImageView++;
    }
    textView.textContainer.exclusionPaths = exclusionPaths;
    return exclusionPaths;
}



@end
