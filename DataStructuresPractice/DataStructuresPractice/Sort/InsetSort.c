//
//  InsetSort.c
//  DataStructuresPractice
//
//  Created by hanxiaoqing on 2017/7/3.
//  Copyright © 2017年 BabelTime. All rights reserved.
//

#include <stdio.h>


void insertSort(int array[], int length)
{
// i从1开始，因为插入排序原则是每插入一个新元素之前前面的元素已经是有序的，因此刚开始插的时候把数组存在的第一个元素当成
// 有序数组
    for (int i = 1; i < length; i++) {
        
        int newInserValue = array[i]; // 暂存新插入的元素值
        
        int index = i; // 记录最初插入的index
        
        // 新插入元素跟跟前一个位置比较，新插入比较小，把数组元素往后移动一位，继续往前比较。直到找到合适的位置index
        for (int j = i - 1; (j > 0) && (array[j] > newInserValue); j--) {
            array[j + 1] = array[j];
            index = j;
        }
        // 找到合适的index 插入
        array[index] = newInserValue;
    }
}



void TestInsertSort()
{
    int a[5] = {1,6,3,9,2};
    
    insertSort(a,5);
    
    for (int index = 0; index < 5; index ++) {
        printf("%d \n",a[index]);
    }
}
