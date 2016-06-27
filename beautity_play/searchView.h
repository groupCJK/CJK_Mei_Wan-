//
//  searchView.h
//  beautity_play
//
//  Created by user_kevin on 16/6/26.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol searchViewDelegate <NSObject>
/**条件搜索性别选择*/
- (void)sexChooseButtonClick:(UIButton *)sender;

@end

@interface searchView : UIView
{
    BOOL isSelect[5];
}
@property(nonatomic,weak)id<searchViewDelegate>delegate;

@end
