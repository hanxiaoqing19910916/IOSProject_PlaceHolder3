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

#import "WellUser.h"
#import "WellPerson.h"


#import "BankAccount.h"

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

__strong BankAccount *ba;


- (void)testKVC_KVO
{
    ba = [[BankAccount alloc] init];
    [ba addObserver:self forKeyPath:@"currentBalance" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [ba addObserver:self forKeyPath:@"peoples" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    NSMutableArray *ps = [ba mutableArrayValueForKey:@"peoples"];
    [ps addObject:@"daddd"];
    
    // ba.currentBalance = @(75687);
    //[ba setValue:@(33) forKey:@"currentBalance"];
    
    [ba setValue:@"zhangsan" forKeyPath:@"owner"];
    
    NSDictionary *dict = [ba dictionaryWithValuesForKeys:@[@"currentBalance",@"owner"]];
}

- (void)testCopy_MutableCopy
{
    NSArray *array = @[@"ddd"];
    NSArray *copyArray = [array copy]; // copyArray 和 array 内存一样，
    NSArray *mcopyArray = [array mutableCopy]; // mcopyArray进行了另开辟空间复制
    [(NSMutableArray *)mcopyArray addObject:@"dd"]; // 深拷贝后，成为可变类型
    
    
    NSMutableArray *mArray = [NSMutableArray arrayWithObject:@"ddddd"];
    NSArray *copymArray = [mArray copy]; // copymArray 进行了另开辟空间复制
    //[(NSMutableArray *)copymArray addObject:@"dd"]; // 浅拷贝后成为不可变类型,强转不可变addObject崩溃
    NSArray *mcopymArray = [mArray mutableCopy];
    [(NSMutableArray *)mcopymArray addObject:@"dd"];
    
}


- (void)testString
{
    NSString *str = @"dddd";
    NSString *str1 = @"dddd";
    NSString *str2 = [[NSString alloc] initWithString:@"dddd"];
    NSLog(@"str：%p ---- str1：%p ----str2：%p",str, str1, str2);  // str str1 str2 指向同一份内存
   
    NSString *str2Copy = [str2 copy];
    NSString *str2MCopy = [str2 mutableCopy];
    NSLog(@"str2 copy后地址：%p \n str2 mutableCopy后地址：%p",str2Copy, str2MCopy); // copy还会指向旧对象，mutableCopy新开辟空间复制
    
    
    NSMutableString *str3 = [NSMutableString string];
    [str3 appendString:@"dddd"];
    NSLog(@"通过NSMutableString创建并append 跟str str1 str2一样内容的字符串：%p",str3); // 会开辟新空间，尽管内容跟str str1 str2一样
}





- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //WellPerson.class;
    [self testString];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    
}

@end
