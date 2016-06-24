//
//  mineViewController.m
//  text
//
//  Created by user_kevin on 16/6/23.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "mineViewController.h"
#import "headerName.pch"
#import "CJKNavigationView.h"

@interface mineViewController ()<CJKNavigationViewDelegate>

@end

@implementation mineViewController


-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creat_navigationView];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
- (void)creat_navigationView
{
    CJKNavigationView * baseView = [[CJKNavigationView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 30)];
    baseView.titleLabel.text = @"我的";
    baseView.delegate = self;

    [self.view addSubview:baseView];
}
#pragma mark----导航栏按钮函数
-(void)leftButtonClick:(UIButton *)sender
{
    NSLog(@"左");
}
-(void)rightButtonClick:(UIButton *)sender
{
    NSLog(@"右");
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
