//
//  AFNetRequest.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-7.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "AFNetRequest.h"

@implementation AFNetRequest
+ (void)getBanner_listWithSuccess:(successBlock)aSuccess
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.yuike.com/beautymall/api/1.0/client/banner_list.php?yk_appid=1&sid=6b94d8ee8b05caffc4b7c361c0f979f5&yk_pid=1&yk_cbv=2.8.4.2" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        aSuccess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"fail===>>%@",error);
    }];
}
#pragma mark- 人气榜
+ (void)getCategoryWithSuccess:(successBlock)aSuccess
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.yuike.com/beautymall/api/1.0/category/ranking_list.php?yk_appid=1&sid=6b94d8ee8b05caffc4b7c361c0f979f5&yk_pid=1&yk_cbv=2.8.4.2" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        aSuccess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"category=====>>%@",error);
    }];
}
#pragma mark- 精选单品
+ (void)getProductWithSuccess:(successBlock)aSuccess
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.yuike.com/beautymall/api/1.0/product/quality.php?cursor=0&yk_pid=1&yk_cbv=2.8.4.2&count=40&yk_user_id=2061882&yk_appid=1&sid=6b94d8ee8b05caffc4b7c361c0f979f5&type=choice" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        aSuccess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"category=====>>%@",error);
    }];

}
#pragma mark- 活动
+ (void)getActivityWithSuccess:(successBlock)aSuccess
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.yuike.com/beautymall/api/1.0/activity/list.php?cursor=0&activity_category_ids=1&yk_cbv=2.8.4.2&yk_pid=1&count=40&yk_user_id=2061882&yk_appid=1&sid=6b94d8ee8b05caffc4b7c361c0f979f5&activity_types=1,2,3,4,5" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
//        NSLog(@"===>%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);


        aSuccess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"activity=====>>%@",error);
    }];

}
#pragma mark- 时尚
+ (void)getFashionWithSuccess:(successBlock)aSuccess
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.yuike.com/beautymall/api/1.0/activity/list.php?cursor=0&activity_category_ids=4&yk_cbv=2.8.4.2&yk_pid=1&count=40&yk_user_id=2061882&yk_appid=1&sid=6b94d8ee8b05caffc4b7c361c0f979f5&activity_types=1,2,3,4,5" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
//        NSLog(@"===>%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
//        
        
        aSuccess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"activity=====>>%@",error);
    }];

}
#pragma mark- 特卖
+ (void)getSpecialWithSuccess:(successBlock)aSuccess
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.yuike.com/beautymall/api/1.0/activity/list.php?cursor=0&activity_category_ids=14&yk_cbv=2.8.4.2&yk_pid=1&count=40&yk_user_id=2061882&yk_appid=1&sid=6b94d8ee8b05caffc4b7c361c0f979f5&activity_types=1,2,3,4,5" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        aSuccess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"category=====>>%@",error);
    }];

}
#pragma mark- 课堂
+ (void)getClassWithSuccess:(successBlock)aSuccess
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.yuike.com/beautymall/api/1.0/activity/list.php?cursor=0&activity_category_ids=2&yk_cbv=2.8.4.2&yk_pid=1&count=40&yk_user_id=2061882&yk_appid=1&sid=6b94d8ee8b05caffc4b7c361c0f979f5&activity_types=1,2,3,4,5" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        aSuccess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"category=====>>%@",error);
    }];

}
#pragma mark- 穿搭
+ (void)getCombineWithSuccess:(successBlock)aSuccess
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.yuike.com/beautymall/api/1.0/activity/list.php?cursor=0&activity_category_ids=11&yk_cbv=2.8.4.2&yk_pid=1&count=40&yk_user_id=2061882&yk_appid=1&sid=6b94d8ee8b05caffc4b7c361c0f979f5&activity_types=1,2,3,4,5" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        aSuccess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"category=====>>%@",error);
    }];

}
#pragma mark- 编辑推荐
+ (void)getRecommendWithSuccess:(successBlock)aSuccess
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.yuike.com/beautymall/api/1.0/brand/recommend_list.php?yk_appid=1&sid=7d8f2131f16037d50fc86aef992b610f&yk_pid=1&yk_cbv=2.8.4.2" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        aSuccess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"activity=====>>%@",error);
    }];
}
#pragma mark- 搜索
+ (void)getSearchResultWithKeyWord:(NSString *)key success:(successBlock)aSuccess{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@" http://api.yuike.com/beautymall/api/1.0/search/search.php?keyword=%@&count=40&taobao_cid=0&yk_cbv=2.8.4.2&yk_pid=1&type=product&yk_appid=1&sid=7d8f2131f16037d50fc86aef992b610f&cursor=0&yk_user_id=2061882&sort=0&method=1",key] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        aSuccess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"activity=====>>%@",error);
    }];
}
@end
