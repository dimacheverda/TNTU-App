//
//  ArticleTextView.m
//  TNTU App
//
//  Created by Dima on 10/30/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "ArticleTextView.h"
#import "TntuDesignKit.h"
#import "UIColor+TNTUAdditions.h"

@implementation ArticleTextView
{
    NSTextStorage *textStorage;
    NSLayoutManager *layoutManager;
    NSTextContainer *textContainer;
}

- (ArticleTextView *)initWithFrame:(CGRect)frame content:(NSString *)content
{
    // Adding dependencies
    textStorage = [[NSTextStorage alloc] initWithString:content];
    layoutManager = [[NSLayoutManager alloc] init];
    textContainer = [[NSTextContainer alloc] init];
    [textStorage addLayoutManager:layoutManager];
    [layoutManager addTextContainer:textContainer];
    
    self = (ArticleTextView *)[[UITextView alloc] initWithFrame:frame textContainer:textContainer];
    self.font = [TntuDesignKit fontForArticleContent];
    [self setTextContainerInset:UIEdgeInsetsMake(8.0, 2.0, 8.0, 2.0)];
    [self setTextAlignment:NSTextAlignmentLeft];
    [self setSelectable:NO];
    [self setEditable:NO];
    [self setScrollEnabled:YES];
    [self setTextColor:[UIColor tntuArticleColor]];
    
    return self;
}

@end
