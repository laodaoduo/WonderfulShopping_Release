//
//  WJTabBarController.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-7.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "WJTabBarController.h"

@interface WJTabBarController ()

@end

@implementation WJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (UIViewController *)addViewControllerWithString:(NSString *)controllerName title:(NSString *)title image:(NSString *)image addSelectedImage:(NSString *)selectedImage{
    
    Class viewClass = NSClassFromString(controllerName);
    UIViewController *viewController = [[viewClass alloc]init];
    
    viewController.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:image];
//    viewController.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:image] selectedImage:[UIImage imageNamed:selectedImage]];
    
    UINavigationController *viewNav = [[UINavigationController alloc]initWithRootViewController:viewController];
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.viewControllers];
    [array addObject:viewNav];
    self.viewControllers = array;
    
    [viewController.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    return viewController;
    
    
}

@end
