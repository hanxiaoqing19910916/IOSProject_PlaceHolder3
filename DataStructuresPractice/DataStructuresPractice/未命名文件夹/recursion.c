//
//  recursion.c
//  DataStructuresPractice
//
//  Created by hanxiaoqing on 2017/5/15.
//  Copyright © 2017年 BabelTime. All rights reserved.
//

#include <stdio.h>


int stringLength(char *s)
{
    if (s == NULL) {
        return -1;
    }
    
    if (*s == '\0') {
        return 0;
    }
    return stringLength(s + 1) + 1;
}


int fabonacci(int n)
{
    if (n == 0) {
        return 0;
    }
    if (n == 1) {
        return 1;
    }
    return fabonacci(n - 1) + fabonacci(n - 2);
}
