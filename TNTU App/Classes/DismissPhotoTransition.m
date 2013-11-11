//
//  DismissPhotoTransition.m
//  TNTU App
//
//  Created by Dima on 11/5/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "DismissPhotoTransition.h"

@implementation DismissPhotoTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    CGRect fullFrame = [transitionContext initialFrameForViewController:fromVC];
    
    CGFloat height = CGRectGetHeight(fullFrame);
    
    toVC.view.frame =CGRectMake(0.0,
                                0.0,
                                CGRectGetWidth(fullFrame),
                                height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         fromVC.view.frame = CGRectMake(0.0,
                                                      0.0,
                                                      CGRectGetWidth(fullFrame),
                                                      height);
                         fromVC.view.alpha = 0.0;
                     }
                     completion:^(BOOL finished){
                         [transitionContext completeTransition:YES];
                     }];
}

@end
