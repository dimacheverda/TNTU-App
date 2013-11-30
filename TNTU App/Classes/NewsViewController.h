//
//  NewsViewController.h
//  TNTU App
//
//  Created by Dima on 11/19/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UITableViewController

@property (strong,nonatomic) NSString *titleString;
@property (strong,nonatomic) NSString *contentString;
@property (strong,nonatomic) NSArray *imagesNameArray;

@end
