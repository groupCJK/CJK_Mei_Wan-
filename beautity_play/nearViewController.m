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
@interface nearViewController ()<CJKNavigationViewDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation nearViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creat_navigationView];
    [self tableView_creat];
    // Do any additional setup after loading the view.
}

#pragma mark----创建区
-(void)tableView_creat
{
    UITableView * _tableview  =[[UITableView alloc]initWithFrame:CGRectMake(0, 55, width_screen, height_screen-55-40) style:UITableViewStyleGrouped];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableview];
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

#pragma mark----代理区
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 90;
    }else{
        return tableView.frame.size.height-90;
    }
}

#pragma mark----自定义代理区-导航栏按钮
-(void)leftButtonClick:(UIButton *)sender
{
    NSLog(@"左");
}
-(void)rightButtonClick:(UIButton *)sender
{
    NSLog(@"右");
}
#pragma mark----状态栏
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
