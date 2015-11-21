//
//  ActivityModel.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-14.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "ActivityModel.h"

@implementation ActivityModel
- (id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self)
    {
        self.pic_url = [dic objectForKey:@"pic_url"];
        self.url = [dic objectForKey:@"url"];
        self.title = [dic objectForKey:@"title"];
        self.visits_count = [dic objectForKey:@"visits_count"];
        self.likes_count = [dic objectForKey:@"likes_count"];
        self.published_time = [dic objectForKey:@"published_time"];
        self.stard_time = [dic objectForKey:@"stard_time"];
        self.end_time = [dic objectForKey:@"end_time"];
    }
    return self;
}
@end
