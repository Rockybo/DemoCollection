/**
 
 给定一个链表，删除链表的倒数第 n 个节点并返回链表的头指针
 例如，
 给出的链表为: 1→2→3→4→5,
 n=2.
 删除了链表的倒数第n 个节点之后,链表变为

 1→2→3→5.

 备注：
 题目保证 n 一定是有效的请给出请给出时间复杂度为O(n)的算法
 
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

func removeNthFromEnd ( _ head: ListNode?,  _ n: Int) -> ListNode? {
    var n = n
    var fast = head
    
    while n > 0 {
        fast = fast?.next
        n = n - 1
    }
    
    //说明删除的是第一个节点，返回下一个节点
    if fast == nil {
        return head?.next
    }
    var slow = head
    
    while fast?.next != nil {
        fast = fast?.next
        slow = slow?.next
    }
    slow?.next = slow?.next?.next
    return head
    
}
