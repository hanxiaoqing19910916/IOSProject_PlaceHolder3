//
//  WrittenQuestionsCollection.h
//  DataStructuresPractice
//
//  Created by hanxiaoqing on 2017/5/8.
//  Copyright © 2017年 BabelTime. All rights reserved.
//

#ifndef WrittenQuestionsCollection_h
#define WrittenQuestionsCollection_h


//网易2017春招笔试真题编程题：双核处理  http://group.jobbole.com/30260/#comm-84516
//网易2017春招笔试真题编程题：赶去公司  http://group.jobbole.com/30263/#comm-84641
//2016年今日头条校招笔试题：  调度算法 http://group.jobbole.com/28394/
//2016腾讯软件开发面试题    http://blog.csdn.net/Two_Water/article/details/55071376


//从头到尾彻底解析哈希表算法 http://blog.jobbole.com/49229/

//二分查找  http://wap.cnblogs.com/78869/2428375.html?full=1

//时间复杂度为o，怎么找出一个栈里的最大元素
//http://blog.csdn.net/gengdidi/article/details/48625317
//http://blog.csdn.net/datiancai2008/article/details/11067765
//https://zhidao.baidu.com/question/1831456532013168220.html

// leetcode 答案
//http://www.jiuzhang.com/solutions/

//http://blog.jobbole.com/110835/?utm_source=blog.jobbole.com&utm_medium=relatedPosts

// 快速排序
//http://www.cnblogs.com/MOBIN/p/4681369.html

//http://www.jianshu.com/p/ee15c1cf9c16 让 BAT 的 Offer 不再难拿

//http://www.jianshu.com/p/530939374c10 包含BAT面试题目

//http://www.jianshu.com/p/51d04b7639f1 block 原理

//https://bestswifter.com/uikitxing-neng-diao-you-shi-zhan-jiang-jie/ UIKIT性能调优实战

//http://www.cocoachina.com/ios/20141031/10105.html Objective-C Runtime 运行时之一：类与对象

//http://www.cocoachina.com/ios/20170328/18962.html iOS 底层解析weak的实现原理（包含weak对象的初始化，引用，释放的分析）

//http://blog.csdn.net/axllll/article/details/52661374  runtime源码探究（一） weak的实现
//http://blog.csdn.net/axllll/article/details/53926144  runtime源码探究（二）strong的实现

//http://www.jianshu.com/p/a4af5c8ee6a3 Objective-C 小记（9）__strong

//http://kylinroc.github.io/objc-retain-release.html Objective-C 小记（7）retain & release
//http://www.jianshu.com/p/74d669592349 iOS巩基之 不再纠结实例变量&属性
//http://www.cocoachina.com/ios/20160516/16273.html 你真的了解load方法么？
/*
百度

一面：约 1.5 小时
首先是四个算法题：

不用临时变量怎么实现 swap(a, b)——用加法或者异或都可以
http://blog.csdn.net/kingoverlord/article/details/8825721

二维有序数组查找数字——剑指 offer 第 3题

亿级日志中，查找登陆次数最多的十个用户——（不确定对不对，我的思路是）先用哈希表保存登陆次数和ID，然后用红黑树保存最大的十个数。剑指 offer 第 30题

简述排序算法——快排，partion 函数的原理，堆排（不稳定），归并排序，基数排序。

*/


/*
 说说你对 OC 中 load 方法和 initialize 方法的异同。——主要说一下执行时间，各自用途，没实现子类的方法会不会调用父类的？
 说说你对 block 的理解。—— 三种 block，栈上的自动复制到堆上，block 的属性修饰符是 copy，循环引用的原理和解决方案。
 说说你对 runtime 的理解。——主要是方法调用时如何查找缓存，如何找到方法，找不到方法时怎么转发，对象的内存布局。
 说说你对 MVC 和 MVVM 的理解。—— MVC 的 C 太臃肿，可以和 V 合并，变成 MVVM 中的 V，而 VM 用来将 M 转化成 V 能用的数据。
 说说 UITableView 的调优。——一方面是通过 instruments 检查影响性能的地方，另一方面是估算高度并在 runloop 空闲时缓存。
 谈谈你对 ARC 的理解。ARC 是编译器完成的，依靠引用计数，谈谈几个属性修饰符的内存管理策略，什么情况下会内存泄露。
 */



/*
 
 阿里
 
 阿里一面：
 MVC 具有什么样的优势，各个模块之间怎么通信，比如点击 Button 后 怎么通知 Model？
 两个无限长度链表（也就是可能有环） 判断有没有交点
 UITableView 的相关优化
 KVO、Notification、delegate 各自的优缺点，效率还有使用场景
 如何手动通知 KVO
 Objective-C 中的 copy 方法
 runtime 中，SEL 和 IMP 的区别
 autoreleasepool 的使用场景和原理
 RunLoop 的实现原理和数据结构，什么时候会用到
 block 为什么会有循环引用
 使用 GCD 如何实现这个需求：A、B、C 三个任务并发，完成后执行任务 D。
 NSOperation 和 GCD 的区别
 CoreData 的使用，如何处理多线程问题
 如何设计图片缓存？
 有没有自己设计过网络控件？
 
 阿里二面：
 怎么判断某个 cell 是否显示在屏幕上
 进程和线程的区别
 TCP 与 UDP 区别
 TCP 流量控制
 数组和链表的区别
 UIView 生命周期
 
 如果页面 A 跳转到 页面 B，A 的 viewDidDisappear 方法和 B 的 viewDidAppear 方法哪个先调用？ A的viewDidDisappear
 先调用
 
 block 循环引用问题
 ARC 的本质
 RunLoop 的基本概念，它是怎么休眠的？
 Autoreleasepool 什么时候释放，在什么场景下使用？
 如何找到字符串中第一个不重复的字符
 哈希表如何处理冲突
 
 */













#endif 
