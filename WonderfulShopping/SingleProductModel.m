//
//  SingleProductModel.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-13.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "SingleProductModel.h"

@implementation SingleProductModel
- (id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self)
    {//通过kvc为属性赋值
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (id)connectWith:(NSDictionary *)dic
{
    return [[SingleProductModel alloc] initWithDic:dic];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"limit_discount"])
    {
        self.limit_discount_id = value;
    }
}
@end
