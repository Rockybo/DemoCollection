/**
 给定一个无序单链表，实现单链表的排序(按升序排序)。
 输入
 [1,3,2,4,5]
 
 返回值
 {1,2,3,4,5}
 
 你可以在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序吗？
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

func sortInList ( _ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    
    var slow = head, fast = head?.next
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    let temp = slow?.next
    slow?.next = nil
    var left = sortInList(head)
    var right = sortInList(temp)
    var h = ListNode(0)
    let res = h
    
    while left != nil && right != nil {
        if left!.val < right!.val {
            h.next = left
            left = left?.next
        } else {
            h.next = right
            right = right?.next
        }
        h = h.next!
    }
    
    h.next = left != nil ? left : right
    return res.next
}


