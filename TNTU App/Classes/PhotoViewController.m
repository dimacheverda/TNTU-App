//
//  PhotoViewController.m
//  TNTU App
//
//  Created by Dima on 11/4/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageView = self.imageview;
    self.imageView.frame = self.view.frame;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.imageView setUserInteractionEnabled:YES];
    [self.view addSubview:self.imageView];
    self.view.alpha = 0.0;
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Adding Tap Gesture
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(dismiss)];
    [singleTap setNumberOfTapsRequired:1];
    [self.imageView addGestureRecognizer:singleTap];
    

}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
