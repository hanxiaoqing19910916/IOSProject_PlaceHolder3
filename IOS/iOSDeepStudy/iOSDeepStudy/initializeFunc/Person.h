//
//  Person.h
//  iOSDeepStudy
//
//  Created by hanxiaoqing on 2018/2/26.
//  Copyright © 2018年 hanxiaoqing. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 initialize方法
 调动时机：第一次被使用（调用了方法或点语法间接调用类方法）
 1.本类之间：优先调用分类实现的initialize，分类会覆盖本类的initialize
 2.有继承情况：先去父类找寻initialize调用，同样优先调用父类分类实现的initialize
 3.如果子类实现的initialize有调用[super initialize]，则会按照正常方法调用规则：父类分类若有initialize的实现，则优先调用，如无再调用父类实现的initialize
 5.子类分类实现的initialize有调用[super initialize]，则会按照正常方法调用规则：父类分类若有initialize的实现，则优先调用，如无再调用父类实现的initialize
 */

@interface Person : NSObject

@end

@interface Person (extention)

@end
