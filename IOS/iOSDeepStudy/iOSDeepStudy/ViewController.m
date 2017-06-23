//
//  ViewController.m
//  iOSDeepStudy
//
//  Created by hanxiaoqing on 2017/6/23.
//  Copyright © 2017年 hanxiaoqing. All rights reserved.
//

#import "ViewController.h"
#import "KVCExample.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    KVCExample *model = [[KVCExample alloc] init];
    [model setValue:@"wo" forKey:@"name"];
    [model printName];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
