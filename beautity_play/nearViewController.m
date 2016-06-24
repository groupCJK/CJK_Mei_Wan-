//
//  nearViewController.m
//  text
//
//  Created by user_kevin on 16/6/23.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "nearViewController.h"
#import "CJKNavigationView.h"
#import "headerName.pch"
#import "publicHeader.h"
@interface nearViewController ()<CJKNavigationViewDelegate>

@end

@implementation nearViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creat_navigationView];
    // Do any additional setup after loading the view.
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)creat_navigationView
{
    CJKNavigationView * baseView = [[CJKNavigationView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 35)];
    baseView.delegate = self;
    baseView.titleLabel.text = @"首页";
    [baseView.leftButton setBackgroundImage:[UIImage imageNamed:@"list_2"] forState:UIControlStateNormal];
    [baseView.rightButton setBackgroundImage:[UIImage imageNamed:@"shouye-sousuo"] forState:UIControlStateNormal];
    [self.view addSubview:baseView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
