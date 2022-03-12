/**
 题目：链表中倒数第k个节点
 
 输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。

 例如，一个链表有 6 个节点，从头节点开始，它们的值依次是 1、2、3、4、5、6。这个链表的倒数第 3 个节点是值为 4 的节点。

 示例：
 给定一个链表: 1->2->3->4->5, 和 k = 2.
 返回链表 4->5.
 
 */

import Foundation
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/**
 递归
 用res保存该返回的节点，用全局count计数倒数第几个回溯过程中count += 1该是否
 return 当前节点，给上一级的res存着
 */
var count = 0
func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard head != nil else { return nil }
    return find(head,k)
}

func find(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard let h = head else { return nil }
    let res = find(h.next, k)
    if count == k {
        return res
    }
    count = count + 1
    return head
}

/**
 快慢指针
 
 */
func getKthFromEnd1(_ head: ListNode?, _ k: Int) ->ListNode? {
    var fast: ListNode? = head
    var slow: ListNode? = head
    var k = k
    while k > 0 {
        fast = fast?.next
        k = k - 1
    }
    while fast != nil {
        fast = fast?.next
        slow = slow?.next
    }
    return slow
}


