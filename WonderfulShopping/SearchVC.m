//
//  SearchVC.m
//  WonderfulShopping
//
//  Created by LWJ on 15-11-17.
//  Copyright (c) 2015年 laodao. All rights reserved.
//

#import "SearchVC.h"
#import "INSSearchBar.h"
@interface SearchVC ()<INSSearchBarDelegate>
@property (nonatomic, strong) INSSearchBar *searchBarWithoutDelegate;
@property (nonatomic, strong) INSSearchBar *searchBarWithDelegate;
@end

@implementation SearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.000 green:0.418 blue:0.673 alpha:1.000];
    self.searchBarWithDelegate = [[INSSearchBar alloc] initWithFrame:CGRectMake(20.0, 20, 44.0, 34.0)];
    self.searchBarWithDelegate.delegate = self;
    
    [self.view addSubview:self.searchBarWithDelegate];
}
- (CGRect)destinationFrameForSearchBar:(INSSearchBar *)searchBar
{
    return CGRectMake(20.0, 10, CGRectGetWidth(self.view.bounds) - 40.0, 34.0);
}
- (void)searchBarDidTapReturn:(INSSearchBar *)searchBar
{
    NSLog(@"---%@",searchBar.searchField.text);
    NSString *key = [searchBar.searchField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    // Do whatever you deem necessary.
    // Access the text from the search bar like searchBar.searchField.text
    [AFNetRequest getSearchResultWithKeyWord:key success:^(NSDictionary *dic) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
