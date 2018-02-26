//
//  User.h
//  iOSDeepStudy
//
//  Created by hanxiaoqing on 2018/2/26.
//  Copyright © 2018年 hanxiaoqing. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
  load方法
  调动时机：main函数之前
  1.本类之间：先调用自身的load，后调用分类的load
  2.有继承情况：依次递归调用父类load，后调用子类load.
  3.有继承且由有分类实现load，先调动父类load，接着是子类load，然后子类分类的load，最后是父类分类的load
  4.如果子类实现的load有调用[super load]，则会按照正常方法调用规则：父类分类若有load的实现，则优先调用，如无再调用父类实现的load
  5.子类分类实现的load有调用[super load]，则会按照正常方法调用规则：父类分类若有load的实现，则优先调用，如无再调用父类实现的load
  实际应用不加super！！！
 */
@interface User : NSObject

@end


@interface User(extention)

@end

