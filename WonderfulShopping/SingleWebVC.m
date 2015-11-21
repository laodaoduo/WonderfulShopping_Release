//
//  SingleWebVC.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-13.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "SingleWebVC.h"

@interface SingleWebVC ()
@property(nonatomic, retain)SingleProductModel *model;
@end

@implementation SingleWebVC
- (id)initWithModel:(SingleProductModel *)model
{
    self = [super init];
    if (self)
    {
        self.model = model;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.model.mobile_cps_url]]];
    [webView loadRequest:req];
    [self.view addSubview:webView];
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
