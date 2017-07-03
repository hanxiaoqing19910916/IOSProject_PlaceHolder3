//
//  main.c
//  DataStructuresPractice
//
//  Created by hanxiaoqing on 2017/5/8.
//  Copyright © 2017年 BabelTime. All rights reserved.
//

#include <stdio.h>
#include "BTree.h"

struct Node
{
    BTreeNode header;
    char v;
};

void printf_data(BTreeNode* node)
{
    if( node != NULL )
    {
        printf("%c", ((struct Node*)node)->v);
    }
}

void testBtree()
{
    struct Node n1 = {{NULL, NULL}, 'A'};
    struct Node n2 = {{NULL, NULL}, 'B'};
    struct Node n3 = {{NULL, NULL}, 'C'};
    
//    struct Node n4 = {{NULL, NULL}, 'D'};
//    struct Node n5 = {{NULL, NULL}, 'E'};
//    struct Node n6 = {{NULL, NULL}, 'F'};
    
    BTree *tree = BTree_Create();
    BTree_Insert(tree, (BTreeNode *)&n1, 0, 0, 0);
    BTree_Insert(tree, (BTreeNode *)&n2, 0, 1, 0);
    BTree_Insert(tree, (BTreeNode *)&n3, 1, 1, 0);
    
    BTree_Display(tree, printf_data, 4, '-');
}


void testStrLength()
{
    int length = stringLength("www");
    printf("stringLength %d \n",length);
}

void testFabonacci()
{
    for (int i = 0; i < 10; i++) {
        int value = fabonacci(i);
        printf("%d \n",value);
    }
}


int main(int argc, const char * argv[]) {
    
    //    testFabonacci();
    //    hannota(3,'a','b','c');
    
//    char s[] = "abc";
//    permutation(s,0,2);
//    return 0;
    TestbubbleSort();
    
    
    int a = 1,b = 2;
    
    __swap(&a,&b);
    
    
    
}
