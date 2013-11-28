//
//  NewsTextView.h
//  TNTU App
//
//  Created by Dima on 11/19/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTextView : UITextView

- (NewsTextView *)initWithFrame:(CGRect)frame content:(NSString *)content;
- (void)addImageViews:(NSArray *)imageViewsArray;

@end
