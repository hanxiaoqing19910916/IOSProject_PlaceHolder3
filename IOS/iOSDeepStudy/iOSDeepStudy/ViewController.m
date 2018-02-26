//
//  ViewController.m
//  iOSDeepStudy
//
//  Created by hanxiaoqing on 2017/6/23.
//  Copyright © 2017年 hanxiaoqing. All rights reserved.
//

#import "ViewController.h"
#import "KVCExample.h"

#import "ClassToolAll.h"
#import "HXConst.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)kvcTest
{
    KVCExample *model = [[KVCExample alloc] init];
    [model setValue:@"wo" forKey:@"name"];
    [model printName];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{


}



@end
