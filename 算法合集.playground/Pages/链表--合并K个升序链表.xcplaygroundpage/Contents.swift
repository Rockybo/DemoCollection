/**
 题目：
 给你一个链表数组，每个链表都已经按升序排列。
 请你将所有链表合并到一个升序链表中，返回合并后的链表。
 
 示例 1：
 输入：lists = [[1,4,5],[1,3,4],[2,6]]
 输出：[1,1,2,3,4,4,5,6]
 解释：链表数组如下：
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 将它们合并到一个有序链表中得到。
 1->1->2->3->4->4->5->6

 */
import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/**
 当做合并多组两个链表
 */
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    guard !lists.isEmpty else { return nil}
    return merge(lists, 0, lists.count - 1)
}

func merge(_ lists: [ListNode?], _ low: Int, _ high: Int) -> ListNode? {
    if low == high {
        return lists[low]
    }
    let mid = low + (high - low) / 2
    let lowList = merge(lists, low, mid)
    let highList = merge(lists, mid+1, high)
    return mergeTwoLists(lowList, highList)
}

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var l1 = list1
    var l2 = list2
    let head = ListNode(-1)
    var cur: ListNode? = head
    
    
    while l1 != nil && l2 != nil {
        if l1!.val <= l2!.val {
            cur?.next = l1
            l1 = l1?.next
        } else {
            cur?.next = l2
            l2 = l2?.next
        }
        cur = cur?.next
    }
    cur?.next = l1 == nil ? l2 : l1
    return head.next
}

