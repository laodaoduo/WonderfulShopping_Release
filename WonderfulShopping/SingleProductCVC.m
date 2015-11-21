//
//  SingleProductCVC.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-7.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "SingleProductCVC.h"
#import "SingleWebVC.h"
@interface SingleProductCVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>
{
    NSMutableArray *_banner_listArr;
    NSMutableArray *_categoryArr;
    
    UIPageControl *_pageControl;
    UIScrollView *_scrollView;
    BOOL _ifLike;
}
@property (nonatomic, retain)NSMutableArray *productArr;
@end

@implementation SingleProductCVC

static NSString * const reuseIdentifier = @"Cell";
- (id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout arr:(NSMutableArray *)aArr
{
    self = [super initWithCollectionViewLayout:layout];
    if (self)
    {
        self.productArr = aArr;
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor grayColor];
    
    [AFNetRequest getBanner_listWithSuccess:^(NSDictionary *dic) {
        _banner_listArr = [[NSMutableArray alloc] initWithArray:[dic objectForKey:@"data"]];
//        NSLog(@"%@",dic);
        
        [self addSubView];
    }];
    
    
    [AFNetRequest getCategoryWithSuccess:^(NSDictionary *dic) {
        _categoryArr = [[NSMutableArray alloc] initWithArray:[[dic objectForKey:@"data"] objectForKey:@"categories"]];
        [self addSubView];
    }];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    //注册cell
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    //集成上拉\下拉
    self.collectionView.header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        NSLog(@" 刷新了饿");
    }];
    
    self.collectionView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        NSLog(@"上拉");
        
        [AFNetRequest getProductWithSuccess:^(NSDictionary *dic) {
            //
            NSArray *arr = [[dic objectForKey:@"data"] objectForKey:@"products"];
            for (NSDictionary *dic in arr)
            {
                SingleProductModel *sinProM = [[SingleProductModel alloc] initWithDic:dic];
                [_productArr addObject:sinProM];
            }

            [self.collectionView reloadData];
        }];
    }];
    
}
- (void)addSubView
{
    //smallView
    UIView *smallView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 200)];
    [self.collectionView addSubview:smallView];
    //scrollView
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 200)];
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(kScreenW*_banner_listArr.count, 200);
    _scrollView.delegate = self;
    _scrollView.tag = 1000;
    [smallView addSubview:_scrollView];
    for (int i = 0; i < _banner_listArr.count; i++)
    {
        UIButton *bannerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        bannerBtn.frame = CGRectMake(kScreenW*i, 0, kScreenW, 200);
        [bannerBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[_banner_listArr[i] objectForKey:@"pic_url"]]] forState:UIControlStateNormal];
        [bannerBtn addTarget:self action:@selector(bannerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        bannerBtn.tag = i;
        [_scrollView addSubview:bannerBtn];
    }
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 180, kScreenW, 20)];
    _pageControl.numberOfPages = _banner_listArr.count;
    _pageControl.pageIndicatorTintColor = [UIColor yellowColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [_pageControl addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventValueChanged];
    [smallView addSubview:_pageControl];
    
    //三个小按钮 和 lab
    NSArray *arr = @[@"签到",@"抽奖",@"热门"];
    NSArray *imgArr = @[@"image_homepage_hotlist",@"image_homepage_shake",@"image_homepage_sign"];
    for (int i = 0; i < 3; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+(20+80)*i, _scrollView.frame.size.height+10, 30, 30);
        [btn setBackgroundImage:[UIImage imageNamed:imgArr[i]] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor redColor];
        btn.layer.cornerRadius = btn.frame.size.height/2.0;
        btn.clipsToBounds = YES;
        [self.collectionView addSubview:btn];
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(btn.frame.origin.x+40, btn.frame.origin.y, 40, 40)];
        lab.text = arr[i];
        lab.font = [UIFont systemFontOfSize:14];
        [self.collectionView addSubview:lab];
    }
    //人气榜
    
    float interval = (kScreenW - 65*4)/5.0;
    UILabel *topLab = [[UILabel alloc] initWithFrame:CGRectMake(10, _scrollView.frame.size.height+50, 200, 30)];
    topLab.text = @"本周人气TOP8";
    topLab.font = [UIFont systemFontOfSize:14];
    [self.collectionView addSubview:topLab];
    for (int i = 0; i < _categoryArr.count; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(interval + (65 + interval)*(i%4), topLab.frame.origin.y+30+10+(10+40)*(i/4), 65, 40);
        button.backgroundColor = [UIColor blueColor];
        button.layer.cornerRadius = 3;
        button.clipsToBounds = YES;
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.titleLabel.numberOfLines = 0;
        [button sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[_categoryArr[i] objectForKey:@"background_pic_url"]]] forState:UIControlStateNormal];
        [button setTitle:[NSString stringWithFormat:@"%@\n%@",[_categoryArr[i] objectForKey:@"taobao_title"],[_categoryArr[i] objectForKey:@"en_taobao_title"]] forState:UIControlStateNormal];
        [self.collectionView addSubview:button];
    }
    
}
#pragma mark- pageControl
- (void)pageChange:(UIPageControl *)page
{
//    UIScrollView *scro = (UIScrollView *)[self.view viewWithTag:1000];
    _scrollView.contentOffset = CGPointMake(320*page.currentPage, 0);
}
#pragma mark- UIScrollowViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage = scrollView.contentOffset.x/kScreenW;
}
#pragma mark- bannerBtnMethoud
- (void)bannerBtnClick:(UIButton *)btn
{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[_banner_listArr[btn.tag] objectForKey:@"url"]]]];
    webView.scalesPageToFit = YES;
    [webView loadRequest:req];
//    [self.view addSubview:webView];
}
#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _productArr.count+1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //移除子视图
    UIImageView *img1 = (UIImageView *)[cell viewWithTag:100];
    [img1 removeFromSuperview];
    UIImageView *img2 = (UIImageView *)[cell viewWithTag:200];
    [img2 removeFromSuperview];
    UILabel *lab = (UILabel *)[cell viewWithTag:300];
    [lab removeFromSuperview];
    if (indexPath.row == 0)
    {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.frame = CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height);
        imgView.image = [UIImage imageNamed:@"064@2x"];
        [cell addSubview:imgView];
        imgView.tag = 200;
        return cell;
    }
    else
    {
        //获取数据
        SingleProductModel *model = _productArr[indexPath.row-1];
        //创建imgView
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.frame = CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height-20);
        [imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.taobao_pic_url]]];
        [cell addSubview:imgView];
        //价格lab
        UILabel *lab = [[UILabel alloc] init];
        lab.frame = CGRectMake(0,imgView.frame.size.height, cell.frame.size.width, 20);
        lab.text = [NSString stringWithFormat:@"%@%@",model.money_symbol,model.taobao_price];
        lab.tag = 300;
        //lab的用户可交互性默认是关
        lab.userInteractionEnabled = YES;
        [cell addSubview:lab];
        //喜欢按钮
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(80, 0, 30, 20)];
        [btn setBackgroundImage:[UIImage imageNamed:@"button_like_text_right"] forState:UIControlStateNormal];
    
        [btn addTarget:self action:@selector(likeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        //        [btn becomeFirstResponder];
        [lab addSubview:btn];
        //喜欢个数
        UILabel *countLab = [[UILabel alloc] initWithFrame:CGRectMake(120, 0, 30, 20)];
        countLab.text = model.likes_count;
        countLab.font = [UIFont systemFontOfSize:11];
        [lab addSubview:countLab];
        //标记imgView的tag值
        imgView.tag = 100;
    }
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
//    SingleProductModel *model = _productArr[indexPath.row];
//    SingleWebVC *webVC = [[SingleWebVC alloc] initWithModel:model];
//    [self.navigationController pushViewController:webVC animated:YES];
    [self.collectionView reloadData];
    NSLog(@"--------");
}

#pragma mark- 喜欢按钮
- (void)likeBtnClick:(UIButton *)btn
{
    _ifLike = !_ifLike;
    if (_ifLike)
    {
        [btn setBackgroundImage:[UIImage imageNamed:@"button_liked_text_right"] forState:UIControlStateNormal];
    }
    else
    {
        [btn setBackgroundImage:[UIImage imageNamed:@"button_like_text_right"] forState:UIControlStateNormal];
    }
}

@end
