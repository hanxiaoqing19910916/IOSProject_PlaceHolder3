//
//  HXConst.h
//  iOSDeepStudy
//
//  Created by hanxiaoqing on 2017/7/27.
//  Copyright © 2017年 hanxiaoqing. All rights reserved.
//

#ifndef HXConst_h
#define HXConst_h



#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

// 通知中心
#define HXNotificationCenter [NSNotificationCenter defaultCenter]



#define NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);


#ifdef DEBUG // 处于开发阶段
#define HXLog(...) NSLog(__VA_ARGS__)
#else // 处于发布阶段
#define HXLog(...)
#endif


// RGB颜色
#define HXColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define kScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)







#endif /* HXConst_h */
