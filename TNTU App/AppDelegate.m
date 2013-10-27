//
//  AppDelegate.m
//  TNTU App
//
//  Created by Dima on 9/16/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "AppDelegate.h"
#import "UIColor+TNTUAdditions.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
    UIColor *backgroundColor = [UIColor tntuLightBlueColor];
    UIColor *textColor = [UIColor tntuLightGrayColor];
    
    [[UINavigationBar appearance] setTintColor:textColor];
    
    // nav bar background color
    [[UINavigationBar appearance] setBarTintColor:backgroundColor];
    
    // setting nav bar title color
    NSDictionary* attrs = @{NSForegroundColorAttributeName:textColor};
    [[UINavigationBar appearance] setTitleTextAttributes:attrs];
    
    // set tab bar background color
    [[UITabBar appearance] setBarTintColor:textColor];
    
    // set tab bar icons color
    [[UITabBar appearance] setTintColor:backgroundColor];
    
    // status bar color
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // setting tab bar icons
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UITabBar *tabBar = tabBarController.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    tabBarItem1.image = [UIImage imageNamed:@"info_line"];
    tabBarItem1.selectedImage = [UIImage imageNamed:@"info_fill"];
    tabBarItem2.image = [UIImage imageNamed:@"date_line"];
    tabBarItem2.selectedImage = [UIImage imageNamed:@"date_fill"];
    tabBarItem3.image = [UIImage imageNamed:@"recent_line"];
    tabBarItem3.selectedImage = [UIImage imageNamed:@"recent_fill"];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
