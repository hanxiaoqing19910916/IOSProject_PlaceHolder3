//
//  KVCExample.h
//  iOSDeepStudy
//
//  Created by hanxiaoqing on 2017/6/23.
//  Copyright © 2017年 hanxiaoqing. All rights reserved.
//

#import <Foundation/Foundation.h>

//系统就会根据key来进行一个搜索，那么KVC执行规则是：
//依次搜索-(NSString*)getName方法，- (NSString*)name方法，- (NSString*)isName方法，这三个方法的先后顺序来查找，如果有，则执行相应的方法，(这是按NSString类型的查找规则)。

//如果没有则继续找，因为key:@”name”，系统也不知道查找的name是什么类型的，那么系统会按照其他数据类型的方式继续找，如数组NSArray查找方式是会找这两个方法
//-(NSUInteger)countOfName
//-(id)objectInNameAtIndex:(NSUInteger)index



//调用setValue：forkey：代码时，系统没有自定属性name，那么底层会怎么做呢， 系统执行的操作：
//系统会去找setName：属性值方法，如果没有找到setName：方法，KVC机制会检查（BOOL）accessInstanceVariablesDirectly方法有没有返回YES，系统默认是返回YES的，但我们可以重写该方法，返回NO，如果是返回NO，没找到setName方法，那么系统就会执行setValue：ForUndefineKey：方法，系统抛出异常，程序Crash。返回YES，继续搜索类里面成员变量，搜索顺序依次是_name、_isName、name、isName，如果找了相应变量，就停止寻找，对该变量进行修改。



@interface KVCExample : NSObject
{
    NSString *_name;
    NSString *_isName;
    
    NSString *name;
    NSString *isName;
}

//@property (assign, nonatomic) NSString *name;

- (void)printName;

@end
