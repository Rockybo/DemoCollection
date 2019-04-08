//
//  ReversalBinaryTree.cpp
//  BinaryTreeDemo
//
//  Created by 李柏林 on 2019/4/8.
//  Copyright © 2019 berlin. All rights reserved.
//
/**
 反转二叉树
 
 queue
 push:队尾插入一个元素
 pop: 最靠前位置的元素拿掉
 size: 返回队列中的元素个数
 empty:判断队列是否为空的
 front：返回值为队列中的第一个元素
 back:返回队列最后一个元素
 */
#include "ReversalBinaryTree.hpp"
#include <queue>
#include <iostream>

using namespace std;

struct BinaryTreeNode {
    int value;
    BinaryTreeNode *lchild;
    BinaryTreeNode *rchild;
};

// 反转二叉树
void reverTree(BinaryTreeNode *bt);

// 层级显示
void level_show(BinaryTreeNode *bt);

void addNode(BinaryTreeNode **bt, int val);


// 添加节点，满足每个父亲节点大于左边的，小于右边的
void addNode(BinaryTreeNode **bt, int val) {
    if ((*bt) == nullptr) {
        (*bt) = new BinaryTreeNode();
        (*bt) -> value = val;
        (*bt) -> lchild = nullptr;
        (*bt) -> rchild = nullptr;
        return;
    }
    
    if (val == (*bt) -> value) {
        return;
    } else if (val < (*bt) -> value) {
        addNode(&(*bt) -> lchild, val);
    } else {
        addNode(&(*bt) -> rchild, val);
    }
}

void level_show(BinaryTreeNode *bt) {
    if (bt == nullptr) return;
    
    queue<BinaryTreeNode *>que;
    que.push(bt);
    
    while (!que.empty()) {
        if (que.front()->lchild != nullptr) {
            que.push(que.front()->lchild);
        }
        
        if (que.front()->rchild != nullptr) {
            que.push(que.front()->rchild);
        }
        
        cout << que.front()->value << " ";
        que.pop();
    }
    
    cout << endl;
}

void reverTree(BinaryTreeNode *bt) {
    if (bt == nullptr) return;
    
    reverTree(bt->lchild);
    reverTree(bt->rchild);
    
    BinaryTreeNode *temp = bt->lchild;
    bt->lchild = bt->rchild;
    bt->rchild = temp;
}


void testReversal() {
    BinaryTreeNode *bt = nullptr;
    
    addNode(&bt, 10);
    addNode(&bt, 2);
    addNode(&bt, 3);
    addNode(&bt, 15);
    addNode(&bt, 18);
    addNode(&bt, 1);
    addNode(&bt, 16);
    
    cout << "反转前："<< endl;
    level_show(bt);
    
    reverTree(bt);
    
    cout << "反转后："<< endl;
    
    level_show(bt);
    
    /*
     反转前：
     10 2 15 1 3 18 16
     反转后：
     10 15 2 18 3 1 16 
     */
}
