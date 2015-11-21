//
//  BrandCell.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-16.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "BrandCell.h"

@implementation BrandCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        for (int i = 0; i < 3; i++)
        {
            _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(100*i, 0, 100, 100)];
            [self addSubview:_imgView];
            
        }
        //logo
        _logoImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 110, 70, 30)];
        [self addSubview:_imgView];
        //收藏数
        _lab = [[UILabel alloc] initWithFrame:CGRectMake(110, 110, 80, 30)];
        [self addSubview:_lab];
        //收藏按钮
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(200, 110, 71, 30);
        [_btn setBackgroundImage:[UIImage imageNamed:@"button_subscribe@2x"] forState:UIControlStateNormal];
        [self addSubview:_btn];
        //描述
        _desLab = [[UILabel alloc] init];
//        NSString *myDes = model.myDescription;
//        float height = [myDes boundingRectWithSize:CGSizeMake(280, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size.height+10;
//        desLab.frame = CGRectMake(10, 140, 280, height);
//        desLab.numberOfLines = 0;
//        desLab.text = myDes;
//        desLab.font = [UIFont systemFontOfSize:12];
        [self addSubview:_desLab];
        //风格
//        _styleLab = [[UILabel alloc] initWithFrame:CGRectMake(10, _desLab.frame.origin.y+height+10, 100, 20)];
//        styleLab.text = [NSString stringWithFormat:@"风格:%@",model.style];
//        [self addSubview:styleLab];
//        styleLab.font = [UIFont systemFontOfSize:14];
        self.backgroundColor = [UIColor whiteColor];
//        cell.bounds = CGRectMake(0, 0, 300, 150+height+40);
    }
    return self;
}
@end
