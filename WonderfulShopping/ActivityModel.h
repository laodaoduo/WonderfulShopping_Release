//
//  ActivityModel.h
//  WonderfulShopping
//
//  Created by LWJ on 15-11-14.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityModel : NSObject
@property (nonatomic, retain)NSString *pic_url, *url, *title, *published_time, *stard_time, *end_time, *visits_count, *likes_count;
- (id)initWithDic:(NSDictionary *)dic;
@end
