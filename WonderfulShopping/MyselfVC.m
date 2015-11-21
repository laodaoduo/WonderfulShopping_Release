//
//  MyselfVC.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-7.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "MyselfVC.h"

@interface MyselfVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}
@end

@implementation MyselfVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.tableHeaderView = [self setHeadView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"identifier"];
    [self.view addSubview:_tableView];
}
#pragma mark- UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
#pragma mark- UITableViewDatasouse
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image = [UIImage imageNamed:@"user_address"];
    cell.textLabel.text = @"asdafa";
    return cell;
}
#pragma mark- setHeadView
- (UIView *)setHeadView
{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 160)];
//    [imgView setImage:[UIImage imageNamed:@"userspace_top_bg.jpg"]];
    imgView.image = [UIImage imageNamed:@"userspace_top_bg.jpg"];
    imgView.backgroundColor = [UIColor grayColor];
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.backgroundColor = [UIColor magentaColor];
    loginBtn.center = CGPointMake(160, 100);
    loginBtn.bounds = CGRectMake(0, 0, 100, 30);
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [imgView addSubview:loginBtn];
    
    UILabel *promptLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 30)];
    promptLab.text = @"登录美丽衣橱,有神秘惊喜哦";
    promptLab.textAlignment = NSTextAlignmentCenter;
    promptLab.textColor = [UIColor magentaColor];
    [imgView addSubview:promptLab];
    
    
    return imgView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
@end
