
/**
 题目：相交链表
 编写一个程序，找到两个单链表相交的起始节点。
 
 //
 题解：当l1走完之后，再次走l2的头部，l2走完会再次走l1的头部
 这样的话就可以了，如果都不相等，那就是无相交链点
 
 
 */

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    guard headB != nil, headA != nil else {return nil}
    var l1 = headA
    var l2 = headB
    while l1 !== l2 {
        if l1 != nil {
            l1 = l1?.next
        } else {
            l1 = headB
        }
        
        if l2 != nil {
            l2 = l2?.next
        } else {
            l2 = headA
        }
    }
    return l1
}
