//
//  ShowPhotoTransition.m
//  TNTU App
//
//  Created by Dima on 11/4/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "ShowPhotoTransition.h"

@interface ShowPhotoTransition ()

@end

@implementation ShowPhotoTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [[transitionContext containerView] addSubview:fromVC.view];
    [[transitionContext containerView] addSubview:toVC.view];
    
    CGRect fullFrame = [transitionContext initialFrameForViewController:fromVC];
    
    CGFloat height = CGRectGetHeight(fullFrame);
    
    toVC.view.frame =CGRectMake(0.0,
                                0.0,
                                CGRectGetWidth(fullFrame),
                                height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         toVC.view.frame = CGRectMake(0.0,
                                                      0.0,
                                                      CGRectGetWidth(fullFrame),
                                                      height);
                         toVC.view.alpha = 1.0;
                     }
                     completion:^(BOOL finished){
                         [transitionContext completeTransition:YES];
                     }];
    
}

@end
