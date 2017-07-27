//
//  NSString+MD5.h
//  AImageDownloader
//
//  Created by Jason Lee on 12-3-9.
//  Copyright (c) 2012年 Taobao. All rights reserved.
//

#import <Foundation/Foundation.h>

/* Source : http://iphonedevelopertips.com/core-services/create-md5-hash-from-nsstring-nsdata-or-file.html */
@interface NSString (MD5)


//md5 32位 加密 （小写）
-(NSString *)md5:(NSString *)str;
- (NSString*)MD5;
- (NSString *)MD5Hash;
-(NSString *)toMd5:(const char *)string;


@end
