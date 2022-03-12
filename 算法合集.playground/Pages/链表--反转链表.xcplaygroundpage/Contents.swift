/**
 题目：反转链表
 
 示例1：
 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？

 题解1：迭代
 利用三个指针操作
 pre指针是指向
 cur指向当前节点
 next指向下一个节点【为了保存节点】
 
 题解2：递归
 比较好理解的https://leetcode-cn.com/problems/reverse-linked-list/solution/shi-pin-jiang-jie-die-dai-he-di-gui-hen-hswxy/
 
 
 
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

//迭代解法：使用两个指针pre和cur，并保存next指针节点，结束条件是cur != nil
func reverseList(_ head: ListNode?) -> ListNode? {
    if head == nil, head?.next == nil {
        return head
    }
    var pre : ListNode? = nil
    var cur = head
    
    while cur != nil {
        let next = cur?.next
        cur?.next = pre
        pre = cur
        cur = next
    }
    return pre
}

//递归解法：关键头结点和剩余链表，归关键是head.next.next = head ,head.next = nil
func reverseList1(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    let pre = reverseList1(head?.next)
    head?.next?.next = head
    head?.next = nil
    return pre
}
