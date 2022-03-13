//
//  ListNode_delete_last_n.cpp
//  C++学习
//
//  Created by libolin on 2022/3/12.
//

#include "ListNode_delete_last_n.hpp"
#include <iostream>
#include <vector>

struct ListNode {
  int val;
  ListNode *next;
  ListNode() : val(0), next(nullptr) {}
  ListNode(int x) : val(x), next(nullptr) {}
  ListNode(int x, ListNode *next) : val(x), next(next) {}
};


 
ListNode * removeNthFromEnd(ListNode *head, int n) {
    ListNode *dummy = new ListNode(0, head);
    ListNode *first = head;
    ListNode *second = dummy;
    
    for (int i = 0; i < n; ++i) {
        first = first->next;
    }
    
    while (first) {
        first = first->next;
        second = second->next;
    }
    
    second->next = second->next->next;
    ListNode *ans = dummy->next;
    delete dummy;
    return ans;
}

using namespace std;

void merge1(vector<int>& nums1, int m, vector<int>& nums2, int n) {
    int p = m + n - 1;
    int p1 = m - 1;
    int p2 = n - 1;
    while (p >= 0) {
        if(nums1[p1] <= nums2[p2]) {
            nums1[p] = nums2[p2--];
        } else if (p1 < 0) {
            nums1[p] = nums2[p2--];
        } else if (p2 < 0) {
            nums1[p] = nums1[p1--];
        } else {
            nums1[p] = nums1[p1--];
        }
        p--;
    }
    
}

void test() {
//    ListNode *node1 = new ListNode(1);
//    ListNode *node2 = new ListNode(2);
//    ListNode *node3 = new ListNode(3);
//    ListNode *node4 = new ListNode(4);
//    ListNode *node5 = new ListNode(5);
//
//    node1->next = node2;
//    node2->next = node3;
//    node3->next = node4;
//    node4->next = node5;
//    node5->next = nullptr;
//
//    ListNode *head = removeNthFromEnd(node1, 2);
    vector<int> nums1 = {1, 2, 3, 0, 0, 0};
    vector<int> nums2 = {2, 5, 6};
    merge1(nums1, 3, nums2, 3);
//    cout << head->val << endl;
    
}
