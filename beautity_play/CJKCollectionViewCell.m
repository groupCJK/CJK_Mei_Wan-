//
//  CJKCollectionViewCell.m
//  beautity_play
//
//  Created by user_kevin on 16/6/26.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "CJKCollectionViewCell.h"
#import "headerName.pch"

@implementation CJKCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        //用户图片
        UIImageView * userImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)-29)];
        userImage.backgroundColor = [UIColor orangeColor];
        [self addSubview:userImage];
        //热门图片
        UIImageView * fireImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, -7, 14, 30)];
        fireImage.image = [UIImage imageNamed:@"hot"];
        [self addSubview:fireImage];
        //热门数字
        UILabel * fireNumber = [[UILabel alloc]initWithFrame:CGRectMake(fireImage.frame.origin.x+fireImage.frame.size.width+5, 7, self.frame.size.width-40, 18)];
        fireNumber.text = @"18";
        fireNumber.textColor = RGB(248, 24, 24);
        fireNumber.font = [UIFont systemFontOfSize:18];
        [self addSubview:fireNumber];
        //昵称
        UILabel * nickLabel = [[UILabel alloc]init];
        nickLabel.font = [UIFont systemFontOfSize:12.0];;
        nickLabel.text = @"Ivan_blank";
        CGSize size = [nickLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:nickLabel.font,NSFontAttributeName, nil]];
        CGFloat nameH = size.height;
        CGFloat nameW = size.width;
        nickLabel.frame = CGRectMake(7, 200-29 , nameW ,nameH );
        nickLabel.textColor = [UIColor blackColor];
        [self addSubview:nickLabel];
        //用户年龄
        UILabel * userAge = [[UILabel alloc]init];
        userAge.font = [UIFont systemFontOfSize:12.0];
        userAge.text = @"22";
        userAge.textColor = RGB(174, 174, 174);
        CGSize ageSize = [userAge.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:userAge.font,NSFontAttributeName, nil]];
        userAge.frame = CGRectMake(nickLabel.frame.size.width+nickLabel.frame.origin.x+5, nickLabel.frame.origin.y, ageSize.width, ageSize.height);
        [self addSubview:userAge];
        //性别图标
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(userAge.frame.size.width+userAge.frame.origin.x+5, userAge.frame.origin.y+2, 10, 10)];
        imageView.image = [UIImage imageNamed:@"nvsheng_logo"];
        [self addSubview:imageView];
        //定位图标
        UIImageView * locationImage = [[UIImageView alloc]initWithFrame:CGRectMake(imageView.frame.size.width+imageView.frame.origin.x+5, imageView.frame.origin.y, 10, 10)];
        locationImage.image = [UIImage imageNamed:@"juli"];
        [self addSubview:locationImage];
        
    }
    return self;
}

@end
