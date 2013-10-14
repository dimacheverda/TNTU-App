//
//  PopoverTableViewController.h
//  TNTU App
//
//  Created by Dima on 10/13/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopoverTableViewControllerDelegate;

@interface PopoverTableViewController : UITableViewController

@property (nonatomic, weak) id <PopoverTableViewControllerDelegate> delegate;
@property (nonatomic) NSInteger groupNumber;

@end

@protocol PopoverTableViewControllerDelegate <NSObject>

@required

- (void)popoverTableViewController:(PopoverTableViewController *)controller
                didSelectGroupName:(NSString *)groupName;

@end