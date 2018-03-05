//
//  BankAccount.m
//  iOSDeepStudy
//
//  Created by hanxiaoqing on 2018/3/5.
//  Copyright © 2018年 hanxiaoqing. All rights reserved.
//

#import "BankAccount.h"

@implementation BankAccount

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.peoples =  @[].mutableCopy;
    }
    return self;
}


- (void)dealloc
{
    
}


@end
