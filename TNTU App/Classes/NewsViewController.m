//
//  NewsViewController.m
//  TNTU App
//
//  Created by Dima on 11/19/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsTextView.h"
#import "UIImageView+AFNetworking.h"

@interface NewsViewController ()

@property (strong, nonatomic) UIView *footerView;
@property (strong, nonatomic) NewsTextView *textView;
@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation NewsViewController
{
    NSMutableArray *imageViewsArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.footerView = [[UIView alloc] init];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.numberOfLines = 0;
    [self.titleLabel sizeToFit];
    self.titleLabel.text = self.titleString;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.footerView addSubview:self.titleLabel];
    
    
    self.textView = [[NewsTextView alloc] initWithFrame:CGRectZero content:self.contentString];
    [self.footerView addSubview:self.textView];
    [self.tableView addSubview:self.footerView];
    
    // Initialasing imageViewsArray
    imageViewsArray = [NSMutableArray new];
    for (NSString *imageName in self.imagesNameArray) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        [imageViewsArray addObject:imageView];
    }
    
    [self.textView addImageViews:imageViewsArray];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.titleLabel.frame = CGRectMake(10.0,
                                       0.0,
                                       300.0,
                                       88.0);
    
    self.textView.frame = CGRectMake(0.0,
                                     self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + 5.0,
                                     320.0,
                                     self.textView.contentSize.height);
    self.footerView.frame = CGRectMake(0.0,
                                       0.0,
                                       320.0,
                                       self.textView.contentSize.height);
    self.tableView.contentSize = CGSizeMake(320.0,
                                            self.textView.frame.size.height + self.textView.frame.origin.y);
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

@end
