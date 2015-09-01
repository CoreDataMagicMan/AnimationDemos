//
//  AppDelegate.m
//  DMCAAnimation
//
//  Created by Vito on 8/14/15.
//  Copyright (c) 2015 vito. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <UITabBarControllerDelegate>

@property (nonatomic, strong) UITabBarController *tabBarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
//    UIViewController *viewController1 = [[UIViewController alloc] init];
//    viewController1.view.backgroundColor = [UIColor orangeColor];
//    UIViewController *viewController2 = [[UIViewController alloc] init];
//    self.tabBarController = [[UITabBarController alloc] init];
//    self.tabBarController.viewControllers = @[viewController1, viewController2];
//    self.tabBarController.delegate = self;
//    self.window.rootViewController = self.tabBarController;
//    [self.window makeKeyAndVisible];
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{

    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.duration = 2.0;
    //apply transition to tab bar controller's view
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
}

@end
