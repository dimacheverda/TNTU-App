//
//  ArticleTextView.m
//  TNTU App
//
//  Created by Dima on 10/30/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "ArticleTextView.h"
#import "UIColor+TNTUAdditions.h"
#import "UIFont+TNTUAdditions.h"

@interface ArticleTextView () <UIGestureRecognizerDelegate>

@end

@implementation ArticleTextView
{
    NSTextStorage *textStorage;
    NSLayoutManager *layoutManager;
    NSTextContainer *textContainer;
}

- (ArticleTextView *)initWithFrame:(CGRect)frame
{
    // Adding dependencies
    textStorage = [[NSTextStorage alloc] init];
    layoutManager = [[NSLayoutManager alloc] init];
    textContainer = [[NSTextContainer alloc] init];
    [textStorage addLayoutManager:layoutManager];
    [layoutManager addTextContainer:textContainer];
    
    self = [[ArticleTextView alloc] initWithFrame:frame textContainer:textContainer];
    self.font = [UIFont fontForArticleContent];
    [self setTextContainerInset:UIEdgeInsetsMake(8.0, 2.0, 8.0, 2.0)];
    [self setTextAlignment:NSTextAlignmentLeft];
    [self setSelectable:NO];
    [self setEditable:NO];
    [self setScrollEnabled:YES];
    [self setTextColor:[UIColor tntuArticleTextColor]];
    
    [self setBackgroundColor:[UIColor tntuArticleBackgroundColor]];
    
    return self;
}

- (ArticleTextView *)initWithFrame:(CGRect)frame content:(NSString *)content
{
    // Adding dependencies
    textStorage = [[NSTextStorage alloc] initWithString:content];
    layoutManager = [[NSLayoutManager alloc] init];
    textContainer = [[NSTextContainer alloc] init];
    [textStorage addLayoutManager:layoutManager];
    [layoutManager addTextContainer:textContainer];
    
    self = [[ArticleTextView alloc] initWithFrame:frame textContainer:textContainer];
    self.font = [UIFont fontForArticleContent];
    [self setTextContainerInset:UIEdgeInsetsMake(8.0, 2.0, 8.0, 2.0)];
    [self setTextAlignment:NSTextAlignmentLeft];
    [self setSelectable:NO];
    [self setEditable:NO];
    [self setScrollEnabled:YES];
    [self setTextColor:[UIColor tntuArticleTextColor]];
    
    [self setBackgroundColor:[UIColor tntuArticleBackgroundColor]];
    
    return self;
}

static CGFloat kImageViewHeight = 14*9;
static CGFloat kImageViewWidth = 160;
static CGFloat kImageViewPadding = 30*14;

- (void)addImageViews:(NSArray *)imageViewsArray
{
    NSInteger currentImageView = 0;
    NSMutableArray *exclusionPaths = [NSMutableArray new];
    
    for (UIImageView *imageView in imageViewsArray) {
        
        // Layout Image View
        CGRect frame = CGRectMake((currentImageView % 2) * 160.0,
                                  kImageViewPadding * currentImageView + kImageViewHeight,
                                  kImageViewWidth,
                                  kImageViewHeight);
        imageView.frame = frame;
        
        // Adding to exclusion paths
        UIBezierPath* exclusionPath = [UIBezierPath bezierPathWithRect:CGRectMake(imageView.frame.origin.x - 3.0,
                                                                                  imageView.frame.origin.y - 10.0,
                                                                                  imageView.frame.size.width + 3.0,
                                                                                  imageView.frame.size.height + 10.0)];
        [exclusionPaths addObject:exclusionPath];
        [self addSubview:imageView];
        currentImageView++;
    }
    self.textContainer.exclusionPaths = exclusionPaths;
}

@end
