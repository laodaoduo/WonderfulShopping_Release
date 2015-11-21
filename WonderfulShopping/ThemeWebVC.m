//
//  ThemeWebVC.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-16.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "ThemeWebVC.h"

@interface ThemeWebVC ()

@end

@implementation ThemeWebVC
- (id)initWithModel:(ActivityModel *)model
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
    
    UIWebView *web = [[UIWebView alloc] initWithFrame:self.view.frame];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.model.url]]];
    [web loadRequest:req];
    web.scalesPageToFit = YES;
    [self.view addSubview:web];
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
