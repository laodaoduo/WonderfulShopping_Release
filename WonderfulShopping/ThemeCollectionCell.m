//
//  ThemeCollectionCell.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-16.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "ThemeCollectionCell.h"

@implementation ThemeCollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //图片
        self.bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 165)];
        [self addSubview:self.bgImgView];
        //标题
        self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(10, _bgImgView.frame.size.height+10, 200, 25)];
        [self addSubview:self.titleLab];
        //剩余时间
        self.remainTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(10, _bgImgView.frame.size.height+45, 200, 25)];
        [self addSubview:self.remainTimeLab];
        //浏览数
        self.visitLab = [[UILabel alloc] initWithFrame:CGRectMake(200, _bgImgView.frame.size.height+80, 50, 20)];
        [self addSubview:self.visitLab];
        //喜欢数
        self.likeLab = [[UILabel alloc] initWithFrame:CGRectMake(270, _bgImgView.frame.size.height+80, 30, 20)];
        [self addSubview:self.likeLab];
        //关注按钮
        self.visitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.visitBtn.frame = CGRectMake(170, _bgImgView.frame.size.height+80, 20, 20);
        [_visitBtn setBackgroundImage:[UIImage imageNamed:@"yuike_maintab_iconfound_nor"] forState:UIControlStateNormal];
        [self addSubview:self.visitBtn];
        //喜欢按钮
        self.likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.likeBtn.frame = CGRectMake(240, _bgImgView.frame.size.height+80, 20, 20);
        [_likeBtn setBackgroundImage:[UIImage imageNamed:@"like_count"] forState:UIControlStateNormal];
        /**
         *  不能写在这 会重用
         */
//        [_likeBtn setBackgroundImage:[UIImage imageNamed:@"button_liked_borded@2x"] forState:UIControlStateSelected];
        [self addSubview:self.likeBtn];
    }
    return self;
}
@end
