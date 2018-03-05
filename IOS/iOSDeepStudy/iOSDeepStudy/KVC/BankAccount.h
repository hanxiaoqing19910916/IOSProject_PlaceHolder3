//
//  BankAccount.h
//  iOSDeepStudy
//
//  Created by hanxiaoqing on 2018/3/5.
//  Copyright © 2018年 hanxiaoqing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BankAccount : NSObject

@property (nonatomic, strong) NSNumber *currentBalance;
@property (nonatomic, strong) NSString *owner;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) NSMutableArray<NSString *> *peoples;

@end
