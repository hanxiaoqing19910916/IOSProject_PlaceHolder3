//
//  UILabel+AttributedString.h
//  Wendaifu_H
//
//  Created by LiuBang on 16/3/30.
//  Copyright © 2016年 lbcode24. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel(UILabel_AttributedString)

/**
 *  设置行间距
 */
@property(nonatomic, assign)CGFloat lineSpacing;

/**
 *  设置部分范围label的字体颜色
 *  @param color 字体颜色
 *  @param range 设置范围
 */
- (void)setLabelColor:(UIColor *)color range:(NSRange)range;

/**
 *  设置部分范围label的字体大小
 *  @param font  字体颜色
 *  @param range 设置范围
 */

- (void)setLabelFont:(UIFont *)font range:(NSRange)range;

@end
