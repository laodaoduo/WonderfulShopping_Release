//
//  ThemeWebVC.h
//  WonderfulShopping
//
//  Created by LWJ on 15-11-16.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"
@interface ThemeWebVC : UIViewController
@property (nonatomic, retain)ActivityModel *model;
- (id)initWithModel:(ActivityModel *)model;
@end
