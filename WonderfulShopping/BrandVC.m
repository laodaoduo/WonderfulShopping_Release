//
//  BrandVC.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-7.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "BrandVC.h"
#import "RecommendModel.h"
@interface BrandVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
    NSMutableArray *_recommendArr;
}
@end

@implementation BrandVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    //初始化编辑推荐数据源数组
    _recommendArr = [[NSMutableArray alloc] init];
    //请求数据
    [AFNetRequest getRecommendWithSuccess:^(NSDictionary *dic) {
        
        NSArray *arr = [[dic objectForKey:@"data"][0] objectForKey:@"brands"];
        for (NSDictionary *dic in arr)
        {
            RecommendModel *model = [[RecommendModel alloc] initWithDic:dic];
            [_recommendArr addObject:model];
        }
        
        [self updateCollectionView];
        [self setSearchBar];
    }];
    
}
- (void)setSearchBar
{
    UISearchBar *search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 30)];
    search.placeholder = @"请输入要搜索内容";
    [self.view addSubview:search];
}
#pragma mark- 加载collectionView
- (void)updateCollectionView
{
    
    UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc] init];
    layOut.itemSize = CGSizeMake(300, 200);
    layOut.minimumLineSpacing = 30;
    layOut.sectionInset = UIEdgeInsetsMake(50, 10, 10, 10);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64+30, self.view.frame.size.width, self.view.frame.size.height-64-49-30) collectionViewLayout:layOut];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"identifier"];
    _collectionView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_collectionView];

}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RecommendModel *model = _recommendArr[indexPath.row];
    NSString *myDes = model.myDescription;
    float height = [myDes boundingRectWithSize:CGSizeMake(280, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size.height;
    return CGSizeMake(300, 150+height+40);
}
#pragma mark- collectionView的代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _recommendArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *cellID = @"identifier";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifier" forIndexPath:indexPath];
    UIImageView *img1 = (UIImageView *)[cell viewWithTag:100];
    [img1 removeFromSuperview];
    UILabel *lab1 = (UILabel *)[cell viewWithTag:200];
    [lab1 removeFromSuperview];
    UIButton *btn1 = (UIButton *)[cell viewWithTag:300];
    [btn1 removeFromSuperview];
    UILabel *lab2 = (UILabel *)[cell viewWithTag:400];
    [lab2 removeFromSuperview];
    UILabel *lab3 = (UILabel *)[cell viewWithTag:500];
    [lab3 removeFromSuperview];
    RecommendModel *model = _recommendArr[indexPath.row];
    for (int i = 0; i < 3; i++)
    {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(100*i, 0, 100, 100)];
        [imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.taobao_pic_urls[i]]]];
        [cell addSubview:imgView];
        
    }
    //logo
    UIImageView *logoImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 110, 70, 30)];
    [logoImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.logo_url]]];
    [cell addSubview:logoImg];
    logoImg.tag = 100;
    logoImg.backgroundColor = [UIColor redColor];
    //收藏数
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(110, 110, 80, 30)];
    lab.text = [NSString stringWithFormat:@"%@人收藏",model.likes_count];
    lab.tag = 200;
    [cell addSubview:lab];
    //收藏按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(200, 110, 71, 30);
    [btn setBackgroundImage:[UIImage imageNamed:@"button_subscribe@2x"] forState:UIControlStateNormal];
    btn.tag = 300;
    [cell addSubview:btn];
    //描述
    UILabel *desLab = [[UILabel alloc] init];
    NSString *myDes = model.myDescription;
    float height = [myDes boundingRectWithSize:CGSizeMake(280, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size.height+10;
    desLab.frame = CGRectMake(10, 140, 280, height);
    desLab.numberOfLines = 0;
    desLab.text = myDes;
    desLab.tag = 400;
    desLab.font = [UIFont systemFontOfSize:12];
    [cell addSubview:desLab];
    //风格
    UILabel *styleLab = [[UILabel alloc] initWithFrame:CGRectMake(10, desLab.frame.origin.y+height+10, 100, 20)];
    styleLab.text = [NSString stringWithFormat:@"风格:%@",model.style];
    [cell addSubview:styleLab];
    styleLab.tag = 500;
    styleLab.font = [UIFont systemFontOfSize:14];
    cell.backgroundColor = [UIColor whiteColor];
    cell.bounds = CGRectMake(0, 0, 300, 150+height+40);
    return cell;
}
@end
