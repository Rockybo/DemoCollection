//
//  SortBinaryTree.cpp
//  BinaryTreeDemo
//
//  Created by 李柏林 on 2019/4/8.
//  Copyright © 2019 berlin. All rights reserved.
//  二叉树的排序
/**
 input
 ABDI//J//EK//LQ///CFM//N//GO//P//
 output
 先序遍历:
 A B D I J E K L Q C F M N G O P
 中序遍历
 I D J B K E Q L A M F N C O G P
 后序遍历
 I J D K Q L E B M N F O P G C A
 
 
                              A
                        /           \
                       /             \
                      /               \
                    B                 C
                  /   \              /  \
                 /     \            /    \
                D       E          F      G
              /   \   /   \       / \    / \
             I    J   K    L     M   N  O   P
                          /
                         Q
 
 */
#include "SortBinaryTree.hpp"
#include <iostream>
#include <stack>

using namespace std;

typedef struct node {
    struct node *lchild;
    struct node *rchild;
    char data;
}BiTreeNode, *BiTree;

void createBiTree(BiTree &T) {
    char c;
    cin >> c;
    
    if ('/' == c) {
        T = NULL;
    } else {
        T = new BiTreeNode();
        T->data = c;
        createBiTree(T->lchild);
        createBiTree(T->rchild);
    }
}

#pragma mark - 非递归
void preOrder(BiTree T) {
    stack<BiTree> s;
    while (T != NULL || !s.empty()) {
        if (T != NULL) {
            cout << T->data << " ";
            s.push(T);
            T = T->lchild;
        } else {
            T = s.top();
            s.pop();
            T = T->rchild;
        }
    }
}

void midOrder(BiTree T) {
    stack<BiTree> s;
    while (T != NULL || !s.empty()) {
        if (T != NULL) {
            s.push(T);
            T = T->lchild;
        } else {
            T = s.top();
            s.pop();
            cout << T->data << " ";
            T = T->rchild;
        }
    }
}

// 后序遍历
struct statck_org {
    statck_org(BiTree _T, int _line) :T(_T), line(_line){}
    BiTree T;
    int line;
};

void postOrder(BiTree T) {
    stack<statck_org> s;
    s.push(statck_org(T, 1));
    
    while (!s.empty()) {
        switch (s.top().line) {
            case 1:
                if (s.top().T == NULL) {
                    s.pop();
                } else {
                    s.top().line = 2;
                }
                break;
            case 2:
                s.top().line = 3;
                s.push(statck_org(s.top().T->lchild, 1));
                break;
            case 3:
                s.top().line = 4;
                s.push(statck_org(s.top().T->rchild, 1));
                break;
            case 4:
                cout << s.top().T->data << " ";
                s.pop();
                break;
                
            default:
                break;
        }
    }
}

#pragma mark - 递归
void recursive_preOrder(BiTree T) {
    if (T) {
        cout << T->data << " ";
        recursive_preOrder(T->lchild);
        recursive_preOrder(T->rchild);
    }
}

void recursive_midOrder(BiTree T) {
    if (T) {
        recursive_midOrder(T->lchild);
        cout << T->data << " ";
        recursive_midOrder(T->rchild);
    }
}

void recursive_postOrder(BiTree T) {
    if (T) {
        recursive_postOrder(T->lchild);
        recursive_postOrder(T->rchild);
        cout << T->data << " ";
    }
}


void testSortBinaryTree() {
    
    BiTree T;
    
    cout << "构建二叉树" << endl;
    createBiTree(T);
    cout << endl;

    cout << "先序遍历" << endl;
//    preOrder(T);
    recursive_preOrder(T);
    cout << endl;

    cout << "中序遍历" << endl;
//    midOrder(T);
    recursive_midOrder(T);
    cout << endl;

    cout << "后序遍历" << endl;
//    postOrder(T);
    recursive_postOrder(T);
    cout << endl;
    
}
