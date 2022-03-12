/**
 题目描述
 在一个排序的链表中，存在重复的结点，请删除该链表中重复的结点，重复的结点不保留，返回链表头指针。 例如，链表1->2->3->3->4->4->5 处理后为 1->2->5
 
 示例1
 输入
 {1,2,3,3,4,4,5}
 
 返回值
 {1,2,5}
 */
import Foundation


class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ value: Int) {
        self.val = value
        self.next = nil
    }
}


func deleteDuplication ( _ head: ListNode?) -> ListNode? {
    if head?.next == nil {
        return head
    }
    
    var newHead: ListNode?
    var newCur: ListNode?
    
    var pre: ListNode?
    var now: ListNode? = head
    var next: ListNode? = head?.next
    
    while now != nil {
        if pre?.val != now?.val, now?.val != next?.val {
            if newHead == nil {
                newHead = now
                newCur = now
            } else {
                newCur?.next = now
                newCur = now
            }
        }
        pre = now
        now = next
        next = now?.next
    }
    newCur?.next = now
    return newHead
}
