//
//  PhotoViewController.m
//  TNTU App
//
//  Created by Dima on 11/4/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation PhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // setting up image view
//    CGRect photoFrame = CGRectMake(0.0,
//                                   200.0,
//                                   CGRectGetWidth(self.view.frame),
//                                   200.0);
//    NSLog(@"%f, %f", self.photo.size.height, self.photo.size.width);
    
    self.photoView = [[UIImageView alloc] initWithFrame:self.view.frame];
    self.photoView.image = self.photo;
    self.photoView.contentMode = UIViewContentModeScaleAspectFit;
    [self.photoView setUserInteractionEnabled:YES];
//    [self.view addSubview:self.photoView];
    self.view.alpha = 0.0;
    self.view.backgroundColor = [UIColor blackColor];

    //setting up Scroll View
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView.delegate = self;
    [self.scrollView setMaximumZoomScale:2.0];
    [self.scrollView setMinimumZoomScale:1.0];
    [self.scrollView addSubview:self.photoView];
    [self.view addSubview:self.scrollView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Adding Tap Gesture
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(dismiss)];
    [singleTap setNumberOfTapsRequired:1];
    [self.photoView addGestureRecognizer:singleTap];

}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.photoView;
}



@end
