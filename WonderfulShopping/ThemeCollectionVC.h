//
//  ThemeCollectionVC.h
//  WonderfulShopping
//
//  Created by LWJ on 15-11-17.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeCollectionVC : UICollectionViewController
@property (nonatomic, retain)NSArray *totalArr;
- (id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout arr:(NSMutableArray *)arr;
@end
