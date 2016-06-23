//
//  CJKNavigationView.m
//  text
//
//  Created by user_kevin on 16/6/23.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "CJKNavigationView.h"
#import "headerName.pch"

@implementation CJKNavigationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor orangeColor];
        /**左侧按钮*/
        UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.frame = CGRectMake(10, 5, 20, 20);
        [leftButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        leftButton.backgroundColor = [UIColor redColor];
        [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:leftButton];
        self.leftButton = leftButton;
        
        /**右侧按钮*/
        UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame = CGRectMake(width_screen-10-20, 5, 20, 20);
        rightButton.backgroundColor = [UIColor redColor];
        [rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:rightButton];
        self.rightButton = rightButton;
        
        UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 0, width_screen-80, 30)];
        titleLabel.text = @"title";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
    }
    return self;
}
-(void)leftButtonClick:(UIButton *)sender
{
    [self.delegate leftButtonClick:sender];
}
-(void)rightButtonClick:(UIButton *)sender
{
    [self.delegate rightButtonClick:sender];
}
@end
