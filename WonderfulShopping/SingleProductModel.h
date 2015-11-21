//
//  SingleProductModel.h
//  WonderfulShopping
//
//  Created by LWJ on 15-11-13.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleProductModel : NSObject
@property (nonatomic, retain)NSString *taobao_title, *taobao_delist_time, *taobao_selling_price, *tags, *from_title, *freight_payer, *from_logo_url, *money_symbol, *taobao_item_imgs, *comments_count, *discount, *brand, *from_type, *taobao_volume, *taobao_price, *mobile_cps_url, *shares_count, *limit_discount_id, *pc_cps_url, *visits_count, *likes_count, *taobao_url, *taobao_num_iid, *is_delist, *taobao_promo_price, *taobao_pic_url;
- (id)initWithDic:(NSDictionary *)dic;
+ (id)connectWith:(NSDictionary *)dic;
@end
