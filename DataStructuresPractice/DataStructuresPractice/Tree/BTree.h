//
//  BTree.h
//  DataStructuresPractice
//
//  Created by hanxiaoqing on 2017/3/31.
//  Copyright © 2017年 BabelTime. All rights reserved.
//

#ifndef BTree_h
#define BTree_h

#include <stdio.h>

#define BT_LEFT   0
#define BT_RIGHT  1

typedef void BTree;
typedef unsigned long long BTPos;


typedef struct _tag_BTreeNode BTreeNode;
struct _tag_BTreeNode
{
    BTreeNode *left;
    BTreeNode *right;
};


//typedef returnType(^name)(arguments);
typedef void (BTree_Printf)(BTreeNode *);


BTree* BTree_Create();

void BTree_Destroy(BTree* tree);

void BTree_Clear(BTree* tree);

int BTree_Insert(BTree* tree, BTreeNode* node, BTPos pos, int count, int flag);

BTreeNode* BTree_Delete(BTree* tree, BTPos pos, int count);

BTreeNode* BTree_Get(BTree* tree, BTPos pos, int count);

BTreeNode* BTree_Root(BTree* tree);

int BTree_Height(BTree* tree);

int BTree_Count(BTree* tree);

int BTree_Degree(BTree* tree);

void BTree_Display(BTree* tree, BTree_Printf* pFunc, int gap, char div);




























#endif /* BTree_h */
