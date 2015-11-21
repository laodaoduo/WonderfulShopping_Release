//
//  RecommendModel.h
//  WonderfulShopping
//
//  Created by LWJ on 15-11-16.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecommendModel : NSObject
@property (nonatomic, retain)NSString *likes_count, *style, *title, *logo_url, *myDescription;
@property (nonatomic, retain)NSArray *products, *taobao_pic_urls;
- (id)initWithDic:(NSDictionary *)dic;
@end
