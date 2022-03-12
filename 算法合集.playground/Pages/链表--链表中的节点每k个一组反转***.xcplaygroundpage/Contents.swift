//: [Previous](@previous)

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int = 0) {
        self.val = val
        self.next = nil
    }
}


func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    var newHead: ListNode? = ListNode()
    newHead?.next = head
    var cur = newHead
    
    // 检查终止条件
    for _ in 1...k {
        cur = cur?.next
        if cur == nil { return head }
    }
    
    // 翻转 k 之后的结点
    cur = reverseKGroup(cur?.next, k)
    // 翻转当前 k 个结点
    newHead = head
    for _ in 1...k {
        let tmp = newHead?.next
        newHead?.next = cur
        cur = newHead
        newHead = tmp
    }
    
    newHead = cur
    return newHead
}


