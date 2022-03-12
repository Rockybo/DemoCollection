/**
 题目：链表相加
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位数字。
 请你将两个数相加，并以相同形式返回一个表示和的链表。
 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 示例1：
 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 
 题解思路
 创建一个临时节点：用于头结点，新的链表头部，返回的时候返回的是pre.next,并且cur是真正移动的指针，pre = cur
 l1.val + l2.val 并用一个carry进位，表示进位值
 
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


func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1
    var l2 = l2
    let pre = ListNode(-1)
    var cur = pre
    var carry: Int = 0
    
    while l1 != nil || l2 != nil {
        let x = l1 == nil ? 0 : l1!.val
        let y = l2 == nil ? 0 : l2!.val
        var sum = carry + x + y
        carry = sum / 10
        sum = sum % 10
        
        cur.next = ListNode(sum)
        cur = cur.next!
        
        if l1 != nil {
            l1 = l1?.next
        }
        
        if l2 != nil {
            l2 = l2?.next
        }
    }
    if carry == 1 {
        cur.next = ListNode(carry)
        
    }
    return pre.next
}
