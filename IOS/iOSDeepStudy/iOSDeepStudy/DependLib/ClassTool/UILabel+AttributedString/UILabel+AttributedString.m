//
//  UILabel+AttributedString.m
//  Wendaifu_H
//
//  Created by LiuBang on 16/3/30.
//  Copyright © 2016年 lbcode24. All rights reserved.
//

#import "UILabel+AttributedString.h"

@implementation UILabel(UILabel_AttributedString)

@dynamic lineSpacing;

- (void)setLineSpacing:(CGFloat)lineSpacing {
    NSMutableAttributedString *contentString;
    if (self.text != nil) {
        contentString = [[NSMutableAttributedString alloc] initWithString:self.text];
    }
    if (self.attributedText != nil) {
        contentString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    }
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:lineSpacing];
    [contentString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, contentString.length)];
    self.attributedText = contentString;
}

- (void)setLabelColor:(UIColor *)color range:(NSRange)range {
    NSMutableAttributedString *contentString;
    if (self.text != nil) {
        contentString = [[NSMutableAttributedString alloc] initWithString:self.text];
    }
    if (self.attributedText != nil) {
        contentString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    }
    [contentString addAttribute:NSForegroundColorAttributeName value:color range:range];
    self.attributedText = contentString;
}

- (void)setLabelFont:(UIFont *)font range:(NSRange)range {
    NSMutableAttributedString *contentString;
    if (self.text != nil) {
        contentString = [[NSMutableAttributedString alloc] initWithString:self.text];
    }
    if (self.attributedText != nil) {
        contentString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    }
    [contentString addAttribute:NSFontAttributeName value:font range:range];
    self.attributedText = contentString;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
