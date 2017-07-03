//
//  SelectSort.c
//  DataStructuresPractice
//
//  Created by hanxiaoqing on 2017/7/3.
//  Copyright © 2017年 BabelTime. All rights reserved.
//

#include <stdio.h>


void selectSort(int array[],int length)
{
    for (int i = 0; i < length; i++) {
        
        int k = i;
        
        for (int j = i; j < length ; j++) {
            if (array[k] > array[j]) {
                k = j;
            }
        }
        __swapArray(array,i,k);
    }
}


void TestselectSort()
{
    int a[5] = {1,6,3,9,2};
    
    selectSort(a,5);
    
    for (int index = 0; index < 5; index ++) {
        printf("%d \n",a[index]);
    }
}
