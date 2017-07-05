//
//  FastSort.c
//  DataStructuresPractice
//
//  Created by hanxiaoqing on 2017/7/5.
//  Copyright © 2017年 BabelTime. All rights reserved.
//

#include <stdio.h>

void fastSort(int array[],int low, int high)
{
    if (low > high) {
        return;
    }
    int pos = findPos(array, low, high);
    
    fastSort(array, low, pos - 1);
    fastSort(array, pos + 1, high);
}

int findPos(int array[], int low, int high)
{
    if (low > high) {
        return - 1;
    }
    
    int temp = array[low];
    
    while (low < high) {
        while ((low < high) && (array[high] >= temp)) {
            --high;
        }
        array[low] = array[high];
        
        while ((low < high) && (array[low] <= temp)) {
            ++low;
        }
        array[high] = array[low];
    }
    return high;
}

void TestfastSort()
{
    int a[5] = {1,6,3,9,2};
    
    fastSort(a,0,4);
    
    for (int index = 0; index < 5; index ++) {
        printf("%d \n",a[index]);
    }
}
