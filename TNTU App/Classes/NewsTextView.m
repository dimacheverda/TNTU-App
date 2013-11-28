//
//  NewsTextView.m
//  TNTU App
//
//  Created by Dima on 11/19/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "NewsTextView.h"
#import "UIFont+TNTUAdditions.h"
#import "UIColor+TNTUAdditions.h"
#import "MHFacebookImageViewer.h"

@implementation NewsTextView
{
    NSTextStorage *textStorage;
    NSLayoutManager *layoutManager;
    NSTextContainer *textContainer;
}

- (NewsTextView *)initWithFrame:(CGRect)frame content:(NSString *)content
{
    // Adding dependencies
    textStorage = [[NSTextStorage alloc] initWithString:content];
    layoutManager = [[NSLayoutManager alloc] init];
    textContainer = [[NSTextContainer alloc] init];
    [textStorage addLayoutManager:layoutManager];
    [layoutManager addTextContainer:textContainer];
    
    self = [[NewsTextView alloc] initWithFrame:frame textContainer:textContainer];
    self.font = [UIFont fontForArticleContent];
    [self setTextContainerInset:UIEdgeInsetsMake(8.0, 8.0, 8.0, 5.0)];
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
static CGFloat kImageViewPadding = 15*14;

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
        [imageView setupImageViewer];
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
//- (void)addImageViews:(NSArray *)imageViewsArray
//{
//    static NSInteger currentImageView = 0;
//    NSMutableArray *exclusionPaths = [NSMutableArray new];
//    
//    for (UIImageView *imageView in imageViewsArray) {
//        
//        // Layout Image View
//        CGRect frame = CGRectMake(0.0,
//                                  self.contentSize.height + 5.0,
//                                  kImageViewWidth,
//                                  kImageViewHeight);
//        imageView.frame = frame;
//        [imageView setupImageViewer];
//        
//        self.contentSize = CGSizeMake(320.0, self.contentSize.height + kImageViewHeight + 10.0);
//        
//        // Adding to exclusion paths
//        UIBezierPath* exclusionPath = [UIBezierPath bezierPathWithRect:CGRectMake(imageView.frame.origin.x - 3.0,
//                                                                                  imageView.frame.origin.y - 10.0,
//                                                                                  imageView.frame.size.width + 3.0,
//                                                                                  imageView.frame.size.height + 10.0)];
//        [exclusionPaths addObject:exclusionPath];
//        [self addSubview:imageView];
//        currentImageView++;
//    }
//    self.textContainer.exclusionPaths = exclusionPaths;
//}

@end
