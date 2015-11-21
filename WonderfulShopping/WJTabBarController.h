//
//  WJTabBarController.h
//  WonderfulShopping
//
//  Created by LWJ on 15-11-7.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJTabBarController : UITabBarController
- (UIViewController *)addViewControllerWithString:(NSString *)controllerName title:(NSString *)title image:(NSString *)image addSelectedImage:(NSString *)selectedImage;
@end
