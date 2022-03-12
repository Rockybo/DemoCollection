/**
 题目：合并两个有序链表
 
 输入：l1 = [1,2,4], l2 = [1,3,4]
 输出：[1,1,2,3,4,4]
 
 
 思路1：暴力解决
 新建一个哑结点，初始值为-1，然后新建一个指向小数的指针，来回指向l1和l2的小值的指针，但是无论指向哪一个，该指针都会指向下一个节点
 首先，我们设定一个哨兵节点 "prehead" ，这可以在最后让我们比较容易地返回合并后的链表。我们维护一个 prev 指针，我们需要做的是调整它的 next 指针。然后，我们重复以下过程，直到 l1 或者 l2 指向了 null ：如果 l1 当前位置的值小于等于 l2 ，我们就把 l1 的值接在 prev 节点的后面同时将 l1 指针往后移一个。否则，我们对 l2 做同样的操作。不管我们将哪一个元素接在了后面，我们都把 prev 向后移一个元素。

 在循环终止的时候， l1 和 l2 至多有一个是非空的。由于输入的两个链表都是有序的，所以不管哪个链表是非空的，它包含的所有元素都比前面已经合并链表中的所有元素都要大。这意味着我们只需要简单地将非空链表接在合并链表的后面，并返回合并链表。
 
 思路2： 采用递归解法
 我们可以如下递归地定义两个链表里的 merge 操作（忽略边界情况，比如空链表等）
 list1[0]+merge(list1[1:],list2)  list1[0]<list2[0]
 list2[0]+merge(list1,list2[1:])   otherwise
 也就是说，两个链表头部值较小的一个节点与剩下元素的 merge 操作结果合并。
 
 我们直接将以上递归过程建模，同时需要考虑边界情况。
 如果 l1 或者 l2 一开始就是空链表 ，那么没有任何操作需要合并，所以我们只需要返回非空链表。否则，我们要判断 l1 和 l2 哪一个链表的头节点的值更小，然后递归地决定下一个添加到结果里的节点。如果两个链表有一个为空，递归结束。
 
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

// 解法一：暴力解法
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) ->ListNode? {
    var l1 = l1
    var l2 = l2
    let phead = ListNode(-1)
    var preN = phead
    while l1 != nil && l2 != nil {
        if l1!.val <= l2!.val {
            preN.next = l1
            l1 = l1?.next
        } else {
            preN.next = l2
            l2 = l2?.next
        }
        preN = preN.next!
    }
    preN.next = l1 == nil ? l2: l1
    return phead.next
}


// 解法二：采用递归解法
func mergeTwoLists1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2
    } else if (l2 == nil) {
        return l1
    } else if l1!.val  < l2!.val {
        l1?.next = mergeTwoLists(l1?.next, l2)
        return l1
    } else {
        l2?.next = mergeTwoLists(l1, l2!.next)
        return l2
    }
}
