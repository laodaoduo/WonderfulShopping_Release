//
//  ShoppingTrolleyVC.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-7.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "ShoppingTrolleyVC.h"

@interface ShoppingTrolleyVC ()

@end

@implementation ShoppingTrolleyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imgView.image  = [UIImage imageNamed:@"LaunchImage@2x"];
    [self.view addSubview:imgView];
    
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
