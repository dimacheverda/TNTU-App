//
//  TntuDesignKit.h
//  TNTU App
//
//  Created by Dima on 10/28/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TntuDesignKit : NSObject

+ (UIFont *)fontForArticleContent;
+ (CGRect)frameForTitleLabel:(UILabel *)titleLabel;
+ (NSMutableArray *)addImageViews:(NSArray *)imageViewsArray toTextView:(UITextView *)textView;

@end
