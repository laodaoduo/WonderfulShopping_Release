//
//  AppDelegate.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-7.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "AppDelegate.h"
#import "WJTabBarController.h"
#import "HomePageVC.h"
#import "BrandVC.h"
#import "ThemeVC.h"
#import "ShoppingTrolleyVC.h"
#import "MyselfVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self createTabBar];
    
    
    return YES;
}
- (void)createTabBar
{
    WJTabBarController *tabBarVC =[[WJTabBarController alloc] init];
    
    [tabBarVC addViewControllerWithString:@"HomePageVC" title:nil image:@"001" addSelectedImage:@"001"];
    
    [tabBarVC addViewControllerWithString:@"BrandVC" title:@"品牌" image:@"002" addSelectedImage:@"002"];
    [tabBarVC addViewControllerWithString:@"ThemeVC" title:nil image:@"003" addSelectedImage:@"003"];
    [tabBarVC addViewControllerWithString:@"ShoppingTrolleyVC" title:@"购物车" image:@"004" addSelectedImage:@"004"];
    [tabBarVC addViewControllerWithString:@"MyselfVC" title:nil image:@"005" addSelectedImage:@"005"];
    
    
    
    self.window.rootViewController = tabBarVC;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
