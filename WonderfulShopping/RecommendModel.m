//
//  RecommendModel.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-16.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "RecommendModel.h"

@implementation RecommendModel
- (id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self)
    {
        self.likes_count = [dic objectForKey:@"likes_count"];
        self.products = [dic objectForKey:@"products"];
        self.style = [dic objectForKey:@"style"];
        self.taobao_pic_urls = [dic objectForKey:@"taobao_pic_urls"];
        self.myDescription = [dic objectForKey:@"description"];
        self.logo_url = [dic objectForKey:@"logo_url"];
    }
    return self;
}
@end
