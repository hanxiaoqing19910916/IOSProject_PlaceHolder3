//
//  ViewController.m
//  DataStructuresPractice
//
//  Created by hanxiaoqing on 2017/3/23.
//  Copyright © 2017年 BabelTime. All rights reserved.
//

#import "ViewController.h"
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
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    struct Node n1 = {{NULL, NULL}, 'A'};
    struct Node n2 = {{NULL, NULL}, 'B'};
    struct Node n3 = {{NULL, NULL}, 'C'};
    
    struct Node n4 = {{NULL, NULL}, 'D'};
    struct Node n5 = {{NULL, NULL}, 'E'};
    struct Node n6 = {{NULL, NULL}, 'F'};
    
    BTree *tree = BTree_Create();
    BTree_Insert(tree, (BTreeNode *)&n1, 0, 0, 0);
    BTree_Insert(tree, (BTreeNode *)&n2, 0, 1, 0);
    BTree_Insert(tree, (BTreeNode *)&n3, 1, 1, 0);
    
    BTree_Display(tree, printf_data, 4, '-');
    
}



@end
