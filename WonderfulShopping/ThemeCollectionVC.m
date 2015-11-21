//
//  ThemeCollectionVC.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-17.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "ThemeCollectionVC.h"
#import "ThemeCollectionCell.h"
#import "ActivityModel.h"
#import "ThemeWebVC.h"
#import "ThemeCRV.h"
@interface ThemeCollectionVC ()

@end

@implementation ThemeCollectionVC

static NSString * const reuseIdentifier = @"Cell";
static NSString * const headIdentifier = @"Head";
- (id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout arr:(NSMutableArray *)arr
{
    self = [super initWithCollectionViewLayout:layout];
    if (self)
    {
        self.totalArr = arr;
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    self.collectionView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    //注册cell
    [self.collectionView registerClass:[ThemeCollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
//    [self.collectionView registerClass:[ThemeCRV class] forCellWithReuseIdentifier:headIdentifier];
    //注册区头
    [self.collectionView registerClass:[ThemeCRV class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headIdentifier];
//    [self.collectionView registerClass:[ThemeCollectionCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifier];
    
    self.collectionView.header = [MJRefreshHeader headerWithRefreshingBlock:^{
        NSLog(@"hahha");
    }];
    self.collectionView.footer = [MJRefreshFooter footerWithRefreshingBlock:^{
        NSLog(@"heheh");
    }];
}

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    return 1;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _totalArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    ThemeCollectionCell *cell = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    ThemeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    ActivityModel *model = _totalArr[indexPath.section];
    [cell.bgImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.pic_url]]];
    cell.titleLab.text = model.title;
    cell.visitLab.text = model.visits_count;
    cell.likeLab.text = model.likes_count;
    
    NSDate *nowDate = [NSDate date];
    long long end = [model.end_time longLongValue];
    long long now = [nowDate timeIntervalSince1970];

//    NSLog(@"date----=====%@",dateStr);
    long long day = (end-now)/(60*60*24);
    long long hour = ((end-now)%(60*60*24))/(60*60);
    long long minute = ((end-now)%(60*60*24))%(60*60)/60;
//    cell.remainTimeLab.text = [NSString stringWithFormat:@"剩余:%lld天%lld小时%lld分钟",(end-now)/(60*60*24),((end-now)%(60*60*24))/(60*60),((end-now)%(60*60*24))%(60*60)/60];
    cell.remainTimeLab.textColor = [UIColor grayColor];
    if (day>0)
    {
        cell.remainTimeLab.text = [NSString stringWithFormat:@"剩余:%lld天%lld小时%lld分钟",day,hour,minute];
    }
    else if (day<=0&&hour>0)
    {
        cell.remainTimeLab.text = [NSString stringWithFormat:@"剩余:%lld小时%lld分钟",hour,minute];
    }
    else if (hour<=0&&minute>0)
    {
        cell.remainTimeLab.text = [NSString stringWithFormat:@"剩余:%lld分钟",minute];
    }
    else
    {
        cell.remainTimeLab.text = @"已结束";
    }
    cell.backgroundColor = [UIColor whiteColor];
    UIButton *btn  = cell.likeBtn;
//    btn.selected = NO;
    btn.tag = indexPath.row;
    [btn addTarget:self action:@selector(likeBtnClck:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    ThemeCRV *head = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headIdentifier forIndexPath:indexPath];
    ActivityModel *model = _totalArr[indexPath.section];
    double timeStamp = [model.published_time doubleValue];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"beijing"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    NSString *dateStr = [formatter stringFromDate:date];
    head.publishLab.backgroundColor = [UIColor redColor];
    head.publishLab.text = dateStr;
    head.publishLab.textAlignment = NSTextAlignmentCenter;
    return head;
}
- (void)likeBtnClck:(UIButton *)btn
{
    btn.selected = YES;
//    [btn setBackgroundImage:[UIImage imageNamed:@"button_liked_borded@2x"] forState:UIControlStateSelected];
//    ThemeCollectionCell *cell = (ThemeCollectionCell *)btn.superview;
    NSLog(@"===========%lu",btn.tag);
    ThemeCollectionCell *cell = (ThemeCollectionCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:btn.tag inSection:0]];
    [cell.likeBtn setBackgroundImage:[UIImage imageNamed:@"button_liked_borded@2x"] forState:UIControlStateSelected];
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityModel *model = _totalArr[indexPath.section];
    ThemeWebVC *webView = [[ThemeWebVC alloc] initWithModel:model];
    UIView *bgView = (UIView *)webView.navigationController.navigationBar.subviews[0];
    bgView.hidden = YES;
//    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController pushViewController:webView animated:YES];
}

@end
