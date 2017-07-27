//
//  UIViewController+NavBar.h
//  IMModule2.0
//
//  Created by LiuBang on 2017/6/28.
//  Copyright © 2017年 LiuBang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavBar)

- (void)creatNavRightIcon:(UIImage *)icon;

- (void)creatNavRightTitle:(NSString *)title;

- (void)rightButtonAction:(UIButton *)btn;

- (void)leftButtonAction:(UIButton *)btn;

@end
