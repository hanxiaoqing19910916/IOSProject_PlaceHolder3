//
//  BTree.c
//  DataStructuresPractice
//
//  Created by hanxiaoqing on 2017/3/31.
//  Copyright © 2017年 BabelTime. All rights reserved.
//

#include "BTree.h"

#include "stdlib.h"

typedef struct _tag_BTree TBTree;
struct _tag_BTree
{
    int count;
    BTreeNode *root;
};

static void recursive_display(BTreeNode* node, BTree_Printf* pFunc, int format, int gap, char div) // O(n)
{
    int i = 0;
    
    if( (node != NULL) && (pFunc != NULL) )
    {
        for(i=0; i<format; i++)
        {
            printf("%c", div);
        }
        
        pFunc(node);
        
        printf("\n");
        
        if( (node->left != NULL) || (node->right != NULL) )
        {
            recursive_display(node->left, pFunc, format + gap, gap, div);
            recursive_display(node->right, pFunc, format + gap, gap, div);
        }
    }
    else
    {
        for(i=0; i<format; i++)
        {
            printf("%c", div);
        }
        printf("\n");
    }
}


void BTree_Display(BTree* tree, BTree_Printf* pFunc, int gap, char div) // O(n)
{
    TBTree* btree = (TBTree*)tree;
    
    if( btree != NULL )
    {
        recursive_display(btree->root, pFunc, 0, gap, div);
    }
}


BTree* BTree_Create()
{
    // BTree 仅仅是void类型数据封装 具体数据形式是TBTree
    TBTree *ret = (TBTree *)malloc(sizeof(TBTree));
    
    if (ret != NULL)
    {
        ret->count = 0;
        ret->root = NULL;
    }
    return ret;
}

void BTree_Destroy(BTree* tree)
{
    free(tree);
}

void BTree_Clear(BTree* tree)
{
    TBTree *btree = (TBTree *)tree;
    
    if (btree != NULL) {
        btree->count = 0;
        btree->root = NULL;
    }
}


/**
 向二叉树插入某个节点
 @param tree 被插入的二叉树
 @param node 节点数据
 @param pos 指路法的十六进制数 根节点的位置抽象成最低位
 @param count 指路法从根节点移动到当前插入节点需要移动的次数
 @param flag 被插入替代的节点位于当前插入节点的位置（作为左子树还是右子树）
 @return 插入结果
 */
int BTree_Insert(BTree* tree, BTreeNode* node, BTPos pos, int count, int flag)
{
    TBTree *btree = (TBTree *)tree;
    int ret = (btree != NULL) && (node != NULL) && ((flag == BT_LEFT) || (flag == BT_RIGHT));
    
    int bit = 0;
    
    if (ret)
    {
        // 清空当前插入节点的左右子树指针
        node->left = NULL;
        node->right = NULL;
        
        BTreeNode *parent = NULL;
        
        // 定义一个current指针指向当前节点
        BTreeNode *current = btree->root;
        
        while (current != NULL && count != 0) {
            
            bit = pos & 1;
            pos = pos >> 1;
            
            parent = current;
            
            if (bit == BT_LEFT) {
                current = current->left;
            }
            
            if (bit == BT_RIGHT) {
                current = current->right;
            }
            count--;
        }
        // while过后，current指向当前要插入替换的节点，parent指向current父节点
        
        // 通过flag得知current节点作为新插入node节点的左子树还是右子数
        if (flag == BT_LEFT) {
            node ->left = current;
        } else if (flag == BT_RIGHT) {
            node ->right = current;
        }
        
        if (parent != NULL) {
            
            if (bit == BT_LEFT) {
                parent->left = node;
            }
            if (bit == BT_RIGHT) {
                parent->right = node;
            }
            
        }  else {
            btree ->root = node;
        }
        
        btree->count++;
    }
    
    return ret;
}
