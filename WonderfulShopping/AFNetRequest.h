//
//  AFNetRequest.h
//  WonderfulShopping
//
//  Created by LWJ on 15-11-7.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^successBlock)(NSDictionary *dic);
@interface AFNetRequest : NSObject
+ (void)getBanner_listWithSuccess:(successBlock)aSuccess;
+ (void)getCategoryWithSuccess:(successBlock)aSuccess;
+ (void)getProductWithSuccess:(successBlock)aSuccess;
+ (void)getActivityWithSuccess:(successBlock)aSuccess;
+ (void)getRecommendWithSuccess:(successBlock)aSuccess;
+ (void)getFashionWithSuccess:(successBlock)aSuccess;
+ (void)getSpecialWithSuccess:(successBlock)aSuccess;
+ (void)getClassWithSuccess:(successBlock)aSuccess;
+ (void)getCombineWithSuccess:(successBlock)aSuccess;
+ (void)getSearchResultWithKeyWord:(NSString *)key success:(successBlock)aSuccess;
@end
