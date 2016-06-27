//
//  searchView.m
//  beautity_play
//
//  Created by user_kevin on 16/6/26.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "searchView.h"
#import "headerName.pch"

@implementation searchView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIView * baseView = [[UIView alloc]initWithFrame:frame];
        baseView.backgroundColor = [UIColor blackColor];
        baseView.alpha = 0.5;
        [self addSubview:baseView];
        
        //搜索条件View
        UIView * view = [[UIView alloc]init];
        view.center = CGPointMake(self.center.x, self.center.y-20);
        view.bounds = CGRectMake(0, 0, width_screen * 0.64, width_screen* 0.64 *0.74);
        view.layer.cornerRadius = 7;
        view.clipsToBounds = YES;
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        //条件搜索label
        UILabel * tiaojian = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, view.frame.size.width, 20)];
        tiaojian.text = @"条件搜索";
        tiaojian.textColor = RGB(63, 144, 164);
        tiaojian.textAlignment = NSTextAlignmentCenter;
        [view addSubview:tiaojian];
        //line
        UIImageView * lineView = [[UIImageView alloc]initWithFrame:CGRectMake(15, tiaojian.frame.size.height+tiaojian.frame.origin.y+9, view.frame.size.width-30, 0.5)];
        lineView.backgroundColor = RGB(139, 139, 139);
        [view addSubview:lineView];
        //条件
        UIButton * noSex = [UIButton buttonWithType:UIButtonTypeCustom];
        noSex.frame = CGRectMake(lineView.frame.origin.x+10, lineView.frame.size.height+lineView.frame.origin.y+14, 45, 15);
        [noSex setImage:[UIImage imageNamed:@"searchIcon2"] forState:UIControlStateNormal];
        [noSex setTitle:@"不限" forState:UIControlStateNormal];
        noSex.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
        noSex.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
        noSex.titleLabel.font = [UIFont systemFontOfSize:10.0];
        [noSex setTitleColor:RGB(166, 166, 166) forState:UIControlStateNormal];
        noSex.tag = 0;
        [noSex addTarget:self action:@selector(sexChooseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:noSex];
        //
        UIButton * man = [UIButton buttonWithType:UIButtonTypeCustom];
        man.center = CGPointMake(tiaojian.center.x+13, noSex.center.y);
        man.bounds = CGRectMake(0, 0, 45, 15);
        [man setImage:[UIImage imageNamed:@"searchIcon2"] forState:UIControlStateNormal];
        [man setTitle:@"男" forState:UIControlStateNormal];
        man.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
        man.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 15);
        [man setTitleColor:RGB(166, 166, 166) forState:UIControlStateNormal];
        man.titleLabel.font = [UIFont systemFontOfSize:10.0];
        man.tag = 1;
        [man addTarget:self action:@selector(sexChooseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:man];
        //
        UIButton * woman = [UIButton buttonWithType:UIButtonTypeCustom];
        woman.frame = CGRectMake(lineView.frame.size.width+lineView.frame.origin.x-10 - 30, man.frame.origin.y, 45, 15);
        [woman setImage:[UIImage imageNamed:@"searchIcon2"] forState:UIControlStateNormal];
        [woman setTitle:@"女" forState:UIControlStateNormal];
        woman.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
        woman.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 15);
        woman.titleLabel.font = man.titleLabel.font;
        [woman setTitleColor:RGB(166, 166, 166) forState:UIControlStateNormal];
        woman.tag = 2;
        [woman addTarget:self action:@selector(sexChooseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:woman];
        //取消确定按钮View
        UIView * buttonBaseView = [[UIView alloc]initWithFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y+7+view.frame.size.height, view.frame.size.width, 31)];
        buttonBaseView.backgroundColor = [UIColor whiteColor];
        buttonBaseView.layer.cornerRadius = 7;
        buttonBaseView.clipsToBounds = YES;
        [self addSubview:buttonBaseView];
        
        //价格
        UILabel * pricelabel = [[UILabel alloc]init];
        pricelabel.font = [UIFont systemFontOfSize:10.0];
        pricelabel.textColor = RGB(166, 166, 166);
        pricelabel.text = @"价格";
        pricelabel.textAlignment = NSTextAlignmentCenter;
        CGSize priceSize = [pricelabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:pricelabel.font,NSFontAttributeName, nil]];
        pricelabel.frame = CGRectMake(view.frame.size.width/2-priceSize.width/2, noSex.center.y+7.5+10, priceSize.width +10, priceSize.height);
        [view addSubview:pricelabel];
        
        //线
        UIImageView * leftLine = [[UIImageView alloc]initWithFrame:CGRectMake(lineView.frame.origin.x, lineView.frame.origin.y+14+15+10+priceSize.height/2, (lineView.frame.size.width-pricelabel.frame.size.width-lineView.frame.origin.x)/2, 0.5)];
        leftLine.backgroundColor = pricelabel.textColor;
        [view addSubview:leftLine];
        
        UIImageView * rightLine = [[UIImageView alloc]initWithFrame:CGRectMake(pricelabel.frame.origin.x+pricelabel.frame.size.width, leftLine.frame.origin.y, leftLine.frame.size.width, 0.5)];
        rightLine.backgroundColor = leftLine.backgroundColor;
        [view addSubview:rightLine];
        
        NSArray * priceArray = @[@"39元以下",@"39元-69元",@"69元-99元",@"99元以上",@"不限"];
        //价格区间
        for (int i = 0; i<5; i++) {
            UIButton * sectionPrice = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [sectionPrice setTitle:priceArray[i] forState:UIControlStateNormal];
            sectionPrice.titleLabel.textAlignment = NSTextAlignmentCenter;
            sectionPrice.titleLabel.font = [UIFont systemFontOfSize:10.0];
            if (isSelect==NO) {
                
            }else{
                sectionPrice.backgroundColor = tiaojian.textColor;
            }
            sectionPrice.layer.cornerRadius = 3;
            
            CGSize size = [sectionPrice.titleLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:sectionPrice.titleLabel.font,NSFontAttributeName, nil]];
            int row = i/3;  int low = i%3;
            sectionPrice.frame = CGRectMake((lineView.frame.origin.x) + (60) * low, leftLine.frame.origin.y+13 + (10 +size.height+2) * row, 55, size.height + 2);
            NSLog(@"%f",sectionPrice.frame.size.width);

            sectionPrice.tag = i;
            [sectionPrice addTarget:self action:@selector(sectionPriceClick:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:sectionPrice];
        }
        
    }
    return self;
}
- (void)sexChooseButtonClick:(UIButton *)sender
{
    switch (sender.tag) {
        case 0:
        {
            NSLog(@"不限");
        }
            break;
        case 1:
        {
            NSLog(@"男");
        }
            break;
        case 2:
        {
            NSLog(@"女");
        }
            break;
            
        default:
            break;
    }
    [self.delegate sexChooseButtonClick:sender];
}
-(void)sectionPriceClick:(UIButton *)sender
{
    switch (sender.tag) {
        case 0:
        {
            isSelect[0]=YES;
            isSelect[1]=NO;
            isSelect[2]=NO;
            isSelect[3]=NO;
            isSelect[4]=NO;
            
            if (isSelect[0]==YES) {
                sender.backgroundColor = RGB(63, 144, 164);
            }else{
                sender.backgroundColor = [UIColor clearColor];
            }
            
        }
            break;
            
        case 1:
        {
            isSelect[0]=YES;
            isSelect[1]=NO;
            isSelect[2]=NO;
            isSelect[3]=NO;
            isSelect[4]=NO;
            
            if (isSelect[0]==YES) {
                sender.backgroundColor = RGB(63, 144, 164);
            }else{
                sender.backgroundColor = [UIColor clearColor];
            }
        }
            break;
        case 2:
        {
            isSelect[0]=YES;
            isSelect[1]=NO;
            isSelect[2]=NO;
            isSelect[3]=NO;
            isSelect[4]=NO;
            
            if (isSelect[0]==YES) {
                sender.backgroundColor = RGB(63, 144, 164);
            }else{
                sender.backgroundColor = [UIColor clearColor];
            }
        }
            break;
        case 3:
        {
            isSelect[0]=YES;
            isSelect[1]=NO;
            isSelect[2]=NO;
            isSelect[3]=NO;
            isSelect[4]=NO;
            
            if (isSelect[0]==YES) {
                sender.backgroundColor = RGB(63, 144, 164);
            }else{
                sender.backgroundColor = [UIColor clearColor];
            }
        }
            break;
        case 4:
        {
            isSelect[0]=YES;
            isSelect[1]=NO;
            isSelect[2]=NO;
            isSelect[3]=NO;
            isSelect[4]=NO;
            
            if (isSelect[0]==YES) {
                sender.backgroundColor = RGB(63, 144, 164);
            }else{
                sender.backgroundColor = [UIColor clearColor];
            }
        }
            break;
        default:
            break;
    }
}
@end
