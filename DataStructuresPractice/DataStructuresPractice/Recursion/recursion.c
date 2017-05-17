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


void hannota(int n,char ta1,char ta2,char ta3)
{
    if (n == 1) {
        printf("from %c to %c \n",ta1,ta3);
        return;
    }
    else
    {
        hannota(n-1, ta1, ta3, ta2);
        printf("from %c to %c \n",ta1,ta3);
        hannota(n-1, ta2, ta1, ta3);
    }
}


void permutation(char *s ,int begin ,int end)
{
    if (begin == end) { //
        printf("%s \n",s);
    }
    
    for (int i = begin ; i <= end; i++) {
        
        char tmp = s[begin];
        s[begin] = s[i];
        s[i] = tmp;
        
        permutation(s, begin + 1, end);
        
        tmp = s[begin];
        s[begin] = s[i];
        s[i] = tmp;
    }
}









