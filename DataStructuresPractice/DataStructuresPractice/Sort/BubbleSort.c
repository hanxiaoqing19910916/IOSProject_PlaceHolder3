//
//  BubbleSort.c
//  DataStructuresPractice
//
//  Created by hanxiaoqing on 2017/7/3.
//  Copyright © 2017年 BabelTime. All rights reserved.
//

#include <stdio.h>


void bubbleSort(int array[],int length)
{
    for (int i  = 0 ; i < length; i ++) {
        for (int j = length - 1; j > i; j--) {
            if (array[j] < array[j - 1]) {
                __swapArray(array,j,j - 1);
            }
        }
    }
}


void TestbubbleSort()
{
    int a[5] = {1,6,3,9,2};
    
    bubbleSort(a,5);
    
    for (int index = 0; index < 5; index ++) {
        printf("%d \n",a[index]);
    }
}
