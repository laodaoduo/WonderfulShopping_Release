//
//  ThemeVC.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-7.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "ThemeVC.h"
#import "ActivityModel.h"
#import "ThemeWebVC.h"
#import "ThemeCollectionVC.h"
@interface ThemeVC ()<UIScrollViewDelegate>
{
    UIButton *_preViousBtn;
    UIView *_moveView;
    
    UIScrollView *_scllowView;
    NSMutableArray *_activityArr;
    NSMutableArray *_fashionArr;
    NSMutableArray *_specialArr;
    NSMutableArray *_classArr;
    NSMutableArray *_combineArr;
    
}
@end

@implementation ThemeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _activityArr = [[NSMutableArray alloc] init];
    _fashionArr = [[NSMutableArray alloc] init];
    _specialArr = [[NSMutableArray alloc] init];
    _classArr = [[NSMutableArray alloc] init];
    _combineArr = [[NSMutableArray alloc] init];
    
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    bgView.userInteractionEnabled = YES;
    bgView.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar addSubview:bgView];
    NSArray *btnTitleArr = @[@"福利",@"时尚",@"特卖",@"课堂",@"穿搭"];
    //按钮
    for (int i = 0; i < 5; i ++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i == 0)
        {
            btn.selected = YES;
            _preViousBtn = btn;
        }
        btn.tag = i+1;
        btn.frame = CGRectMake(i*(self.view.frame.size.width/5.0), 0,self.view.frame.size.width/5.0, 44);
        [btn setTitle:btnTitleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor magentaColor] forState:UIControlStateSelected];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:btn];
        
    }
    //移动的小红条
    _moveView = [[UIView alloc] initWithFrame:CGRectMake(15, 42, 30, 2)];
    _moveView.backgroundColor = [UIColor magentaColor];
    [bgView addSubview:_moveView];
    //scllowView
    [self setScllowView];
    //
    [self requestActitity];
}
#pragma mark- btnClick
- (void)btnClick:(UIButton *)currentBtn
{
    if (currentBtn == _preViousBtn)
    {
        return;
    }
    _preViousBtn.selected = NO;
    //小红条移动
    _moveView.frame = CGRectMake(currentBtn.frame.origin.x+15, 42, 30, 2);
    currentBtn.selected = YES;
    _preViousBtn = currentBtn;
    //根据tag值 设置scllowView的偏移量
    _scllowView.contentOffset = CGPointMake((currentBtn.tag-1)*320, 0);
    switch (currentBtn.tag)
    {
        case 1:
        {
            
            static dispatch_once_t once;
            dispatch_once(&once, ^{
                [self requestActitity];
            });
        }
            break;
        case 2:
        {
            
            static dispatch_once_t once;
            dispatch_once(&once, ^{
                [self requestFashion];
            });
        }
            break;
        case 3:
        {
            static dispatch_once_t once;
            dispatch_once(&once, ^{
                [self requestSpecial];
            });
            
        }
            break;
        case 4:
        {
            static dispatch_once_t once;
            dispatch_once(&once, ^{
                [self requestClass];
            });
            
        }
            break;
        default:
        {
            static dispatch_once_t once;
            dispatch_once(&once, ^{
                [self requestCombine];
            });
            
        }
            break;
    }
    
}
#pragma mark- 加载scllowView
- (void)setScllowView
{
    _scllowView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.frame.size.height-64-49)];
    _scllowView.contentSize = CGSizeMake(320*5, _scllowView.frame.size.height);
    _scllowView.delegate = self;
    _scllowView.pagingEnabled = YES;
    _scllowView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_scllowView];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int btnTag = scrollView.contentOffset.x/320.0+1;
    UIButton *btn = (UIButton *)[_moveView.superview viewWithTag:btnTag];
    //主动调用btn的点击方法
    [self btnClick:btn];
}
#pragma mark- 加载collectionView
- (void)setCollectionViewWith:(NSMutableArray *)arr;
{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(300, 280);
    layout.sectionInset = UIEdgeInsetsMake(40, 10, 10, 10);
    layout.minimumLineSpacing = 40;


    layout.headerReferenceSize = CGSizeMake(320, 40);

    ThemeCollectionVC *collection = [[ThemeCollectionVC alloc] initWithCollectionViewLayout:layout arr:arr];
    [self addChildViewController:collection];
    collection.collectionView.frame = CGRectMake(320*(_preViousBtn.tag-1), 0, 320, _scllowView.frame.size.height);
    [_scllowView addSubview:collection.collectionView];
    
    
}
#pragma mark- 福利请求
- (void)requestActitity
{
    [AFNetRequest getActivityWithSuccess:^(NSDictionary *dic) {
        NSArray *arr = [[dic objectForKey:@"data"] objectForKey:@"activities"];
        for (NSDictionary *dic in arr)
        {
            ActivityModel *model = [[ActivityModel alloc] initWithDic:dic];
            [_activityArr addObject:model];
        }
        [self setCollectionViewWith:_activityArr];
    }];
    
}

#pragma mark- 时尚请求
- (void)requestFashion
{
    [AFNetRequest getFashionWithSuccess:^(NSDictionary *dic) {
        NSArray *arr = [[dic objectForKey:@"data"] objectForKey:@"activities"];
        for (NSDictionary *dic in arr)
        {
            ActivityModel *model = [[ActivityModel alloc] initWithDic:dic];
            [_fashionArr addObject:model];
        }
        [self setCollectionViewWith:_fashionArr];
    }];

}
#pragma mark- 特卖请求
- (void)requestSpecial
{
    [AFNetRequest getSpecialWithSuccess:^(NSDictionary *dic) {
        NSArray *arr = [[dic objectForKey:@"data"] objectForKey:@"activities"];
        for (NSDictionary *dic in arr)
        {
            ActivityModel *model = [[ActivityModel alloc] initWithDic:dic];
            [_specialArr addObject:model];
        }
        [self setCollectionViewWith:_specialArr];
    }];

}
#pragma mark- 课堂请求
- (void)requestClass
{
    [AFNetRequest getClassWithSuccess:^(NSDictionary *dic) {
        NSArray *arr = [[dic objectForKey:@"data"] objectForKey:@"activities"];
        for (NSDictionary *dic in arr)
        {
            ActivityModel *model = [[ActivityModel alloc] initWithDic:dic];
            [_classArr addObject:model];
        }
        [self setCollectionViewWith:_classArr];
    }];

}
#pragma mark- 穿搭请求
- (void)requestCombine
{
    [AFNetRequest getCombineWithSuccess:^(NSDictionary *dic) {
        NSArray *arr = [[dic objectForKey:@"data"] objectForKey:@"activities"];
        for (NSDictionary *dic in arr)
        {
            ActivityModel *model = [[ActivityModel alloc] initWithDic:dic];
            [_combineArr addObject:model];
        }
        [self setCollectionViewWith:_combineArr];
    }];
}

@end
