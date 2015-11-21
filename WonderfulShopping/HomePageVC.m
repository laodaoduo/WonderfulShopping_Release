//
//  HomePageVC.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-7.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "HomePageVC.h"
#import "SingleProductCVC.h"
//#import "SearchVC.h"
#import "BYListBar.h"
#import "BYArrow.h"
#import "BYDetailsList.h"
#import "BYDeleteBar.h"
#import "BYScroller.h"
#import "SearchTwoVC.h"
#define kListBarH 30
#define kArrowW 40
#define kAnimationTime 0.8

@interface HomePageVC ()<UIScrollViewDelegate,UICollectionViewDelegateWaterfallLayout>
{
    NSMutableArray *_productArr;
    UIImageView *_BarImgView;
}
@property (nonatomic,strong) BYListBar *listBar;

@property (nonatomic,strong) BYDeleteBar *deleteBar;

@property (nonatomic,strong) BYDetailsList *detailsList;

@property (nonatomic,strong) BYArrow *arrow;

@property (nonatomic,strong) UIScrollView *mainScroller;

@property (nonatomic, strong) SingleProductCVC *collectionView;
@end

@implementation HomePageVC
- (void)viewWillAppear:(BOOL)animated
{
    _BarImgView.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    //右按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchClick)];
    //初始化数组
    _productArr = [[NSMutableArray alloc] init];
    //请求
    [AFNetRequest getProductWithSuccess:^(NSDictionary *dic) {
        NSArray *arr = [[dic objectForKey:@"data"] objectForKey:@"products"];
        for (NSDictionary *dic in arr)
        {
            SingleProductModel *sinProM = [[SingleProductModel alloc] initWithDic:dic];
            [_productArr addObject:sinProM];
        }
        [self setupNaviBar];
        
        [self makeContent];
    }];
    //navigationBar的背景图片
    _BarImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yuike_logo"]];
    _BarImgView.frame = CGRectMake(0, 0, 280, 44);
    [self.navigationController.navigationBar addSubview:_BarImgView];
}
- (void)searchClick
{
    _BarImgView.hidden = YES;
    SearchTwoVC *search = [[SearchTwoVC alloc] init];
    search.title = @"搜索";
    [self.navigationController pushViewController:search animated:YES];
}
#pragma mark- UICollectionViewCell的高度
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewWaterfallLayout *)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 60;
    }
    else
    {
        SingleProductModel *product = _productArr[indexPath.row-1];
        
        NSString *picUrlStr = product.taobao_pic_url;
        NSArray *arr = [[[picUrlStr componentsSeparatedByString:@"?"] lastObject] componentsSeparatedByString:@"/"];
        if ([arr[3] floatValue]==0.0)
        {
            return 0;
        }
        else
        {
            float height = [[arr lastObject] floatValue]*140/[arr[3] floatValue];
            NSLog(@"+++++++%f",[[arr lastObject] floatValue]);
            return height+20;
        }
        
    }
   
}
#pragma mark- 设置navigationBar
-(void)setupNaviBar
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTranslucent:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg.png"] forBarMetrics:UIBarMetricsDefault];
}
#pragma mark-
-(void)makeContent
{
    NSMutableArray *listTop = [[NSMutableArray alloc] initWithArray:@[@"推荐",@"青春",@"淑女",@"女鞋",@"配饰",@"女包",@"泳装",@"内衣",@"婚礼",@"大码",@"老公",@"妈妈",@"爸爸",@"孕妇",@"男孩",@"女孩",@"生活",@"护肤",@"特卖",@"彩票",@"辟谣"]];
        NSMutableArray *listBottom =[[NSMutableArray alloc]init];
    __weak typeof(self) unself = self;
    
    if (!self.detailsList) {
        self.detailsList = [[BYDetailsList alloc] initWithFrame:CGRectMake(0, kListBarH-kScreenH, kScreenW, kScreenH-kListBarH)];
        self.detailsList.listAll = [NSMutableArray arrayWithObjects:listTop,listBottom, nil];
        self.detailsList.longPressedBlock = ^(){
            [unself.deleteBar sortBtnClick:unself.deleteBar.sortBtn];
        };
        self.detailsList.opertionFromItemBlock = ^(animateType type, NSString *itemName, int index){
            [unself.listBar operationFromBlock:type itemName:itemName index:index];
        };
        [self.view addSubview:self.detailsList];
    }
    
    if (!self.listBar) {
        self.listBar = [[BYListBar alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kListBarH)];
        self.listBar.visibleItemList = listTop;
        self.listBar.arrowChange = ^(){
            if (unself.arrow.arrowBtnClick) {
                unself.arrow.arrowBtnClick();
            }
        };
        self.listBar.listBarItemClickBlock = ^(NSString *itemName , NSInteger itemIndex){
            [unself.detailsList itemRespondFromListBarClickWithItemName:itemName];
            //添加scrollview
            
            //移动到该位置
            unself.mainScroller.contentOffset =  CGPointMake(itemIndex * unself.mainScroller.frame.size.width, 0);
        };
        [self.view addSubview:self.listBar];
    }
    
    if (!self.deleteBar) {
        self.deleteBar = [[BYDeleteBar alloc] initWithFrame:self.listBar.frame];
        [self.view addSubview:self.deleteBar];
    }
    
    
    if (!self.arrow) {
        self.arrow = [[BYArrow alloc] initWithFrame:CGRectMake(kScreenW-kArrowW, 0, kArrowW, kListBarH)];
        self.arrow.arrowBtnClick = ^(){
            unself.deleteBar.hidden = !unself.deleteBar.hidden;
            [UIView animateWithDuration:kAnimationTime animations:^{
                CGAffineTransform rotation = unself.arrow.imageView.transform;
                unself.arrow.imageView.transform = CGAffineTransformRotate(rotation,M_PI);
                unself.detailsList.transform = (unself.detailsList.frame.origin.y<0)?CGAffineTransformMakeTranslation(0, kScreenH):CGAffineTransformMakeTranslation(0, -kScreenH);
            }];
        };
        [self.view addSubview:self.arrow];
    }
    
    if (!self.mainScroller) {
        self.mainScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kListBarH, kScreenW , kScreenH-kListBarH-64)];
        self.mainScroller.backgroundColor = [UIColor yellowColor];
        self.mainScroller.bounces = NO;
        self.mainScroller.pagingEnabled = YES;
        self.mainScroller.showsHorizontalScrollIndicator = NO;
        self.mainScroller.showsVerticalScrollIndicator = NO;
        self.mainScroller.delegate = self;
        self.mainScroller.contentSize = CGSizeMake(kScreenW*10,self.mainScroller.frame.size.height);
        [self.view insertSubview:self.mainScroller atIndex:0];
        
//#warning 预加载、清除防止内存过大等操作暂时不做了~~
        [self addScrollViewWithItemName:@"推荐" index:0];
        [self addScrollViewWithItemName:@"测试" index:1];
    }
//    collectionView
    if (!self.collectionView)
    {
        UICollectionViewWaterfallLayout *layOut = [[UICollectionViewWaterfallLayout alloc] init];
        layOut.delegate = self;
        layOut.itemWidth = 140;
//        UICollectionViewFlowLayout *lay = nil;
//        lay.minimumLineSpacing  = 20;
        layOut.sectionInset = UIEdgeInsetsMake(400, 10, 10, 10);
        self.collectionView = [[SingleProductCVC alloc] initWithCollectionViewLayout:layOut arr:_productArr];
        self.collectionView.view.frame = CGRectMake(0, 0, kScreenW, kScreenH-64-kListBarH-49);
        
        [self.mainScroller addSubview:self.collectionView.view];
    }
}

-(void)addScrollViewWithItemName:(NSString *)itemName index:(NSInteger)index{
    UIScrollView *scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(index * self.mainScroller.frame.size.width, 0, self.mainScroller.frame.size.width, self.mainScroller.frame.size.height)];
    scroller.backgroundColor = RGBColor(arc4random()%255, arc4random()%255, arc4random()%255);
    [self.mainScroller addSubview:scroller];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self.listBar itemClickByScrollerWithIndex:scrollView.contentOffset.x / self.mainScroller.frame.size.width];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
