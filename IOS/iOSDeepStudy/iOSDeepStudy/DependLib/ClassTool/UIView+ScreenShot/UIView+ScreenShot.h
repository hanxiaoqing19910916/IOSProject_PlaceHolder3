//
//  UIWindow+ScreenShot.h
//  Wendaifu_H
//
//  Created by LiuBang on 16/3/18.
//  Copyright © 2016年 lbcode24. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Screenshot)

- (UIImage *)screenshot;
- (UIImage *)screenshotWithRect:(CGRect)rect;

@end
