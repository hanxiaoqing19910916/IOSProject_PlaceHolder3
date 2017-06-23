//
//  KVCExample.m
//  iOSDeepStudy
//
//  Created by hanxiaoqing on 2017/6/23.
//  Copyright © 2017年 hanxiaoqing. All rights reserved.
//

#import "KVCExample.h"

@implementation KVCExample

/**

- (NSString *)getName
{
    NSLog(@"%s",__func__);
    return @"我";
}
- (NSString *)name
{
    NSLog(@"%s",__func__);
    return @"我";
}
- (NSString *)isName
{
    NSLog(@"%s",__func__);
    return @"我";
}
 

- (NSUInteger)countOfName
{
    NSLog(@"%s",__func__);
    return 1;
}

- (id)objectInNameAtIndex:(NSUInteger)index
{
    NSLog(@"%s",__func__);
    return @"我";
}

- (id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"%s",__func__);
    return nil;
}

*/

- (void)setName:(NSString *)name
{
    _name = name;
}

- (void)printName
{
    NSLog(@"_name %@",_name);
    NSLog(@"_isName %@",_isName);
    NSLog(@"name %@",name);
    NSLog(@"isName %@",isName);
}

+ (BOOL)accessInstanceVariablesDirectly
{
    return NO;
}

@end
