//
//  ThemeCollectionCell.h
//  WonderfulShopping
//
//  Created by LWJ on 15-11-16.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeCollectionCell : UICollectionViewCell
@property (nonatomic, retain)UIImageView *bgImgView;
@property (nonatomic, retain)UILabel *titleLab, *remainTimeLab, *visitLab, *likeLab;
@property (nonatomic, retain)UIButton  *likeBtn, *visitBtn;
@end
