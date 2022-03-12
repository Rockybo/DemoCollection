
/**
 题目：请判断一个链表是否为回文链表。
 
 示例 1:
 输入: 1->2
 输出: false
 
 
 示例 2:
 输入: 1->2->2->1
 输出: true
 
 */

import Foundation

class ListNode{
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func isPalindrome(_ head: ListNode?) -> Bool {
    if head == nil {
        return true
    }
    var slow = head
    var fast = head
    var pre: ListNode?
    
    while fast != nil && fast?.next != nil {
        let slowCur = slow
        slow = slow?.next
        fast = fast?.next?.next
        slowCur?.next = pre
        pre = slowCur
    }
    
    var head = pre
    var head2: ListNode? = slow
    
    if fast != nil {
        head2 = slow?.next
    }
    
    while head != nil, head2 != nil {
        if head?.val != head2?.val {
            return false
        }
        head = head?.next
        head2 = head2?.next
    }
    return true
}


