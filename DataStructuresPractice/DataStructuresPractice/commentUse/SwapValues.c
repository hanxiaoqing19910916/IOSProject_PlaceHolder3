//
//  SwapValues.c
//  DataStructuresPractice
//
//  Created by hanxiaoqing on 2017/7/3.
//  Copyright © 2017年 BabelTime. All rights reserved.
//

#include <stdio.h>


void __swap(int *a ,int *b)
{
//    int temp = *a;
//    *a = *b;
//    *b = temp;
    *a  =  (*a) ^ (*b);
    *b  =  (*a) ^ (*b);
    *a  =  (*b) ^ (*a);
}

void __swapArray(int array[],int index1,int index2)
{
    int temp = array[index1];
    array[index1] = array[index2];
    array[index2] = temp;
}

