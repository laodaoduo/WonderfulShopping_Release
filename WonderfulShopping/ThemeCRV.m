//
//  ThemeCRV.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-18.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "ThemeCRV.h"

@implementation ThemeCRV
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.publishLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        [self addSubview:_publishLab];
    }
    return self;
}
@end
