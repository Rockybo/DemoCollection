/**
 题目：环形链表
 
 给定一个链表，判断链表中是否有环。

 如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。注意：pos 不作为参数进行传递，仅仅是为了标识链表的实际情况。

 如果链表中存在环，则返回 true 。 否则，返回 false 。
 
 
 环形链表的解法有两个
 1.hashTable方式存储值，然后遍历
 2.快慢指针的方式
 
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

//快慢指针
func hasCycle(_ head: ListNode?) -> Bool {
    if head == nil || head?.next == nil {
        return false
    }
    var slow = head
    var fast = head?.next
    
    while slow !== fast {
        if fast == nil && fast?.next == nil {
            return false
        }
        slow = slow?.next
        fast = fast?.next?.next
    }
    return true
}


// 需要遵守hashable
extension ListNode: Equatable {
  public static func == (l: ListNode, r: ListNode) -> Bool {
    return l === r
  }
}

extension ListNode: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(ObjectIdentifier(self))
  }
}

class Solution {
     
  func hasCycle(_ head: ListNode?) -> Bool {
    guard head != nil else {
      return false
    }
      
    var head = head
    var hashset = Set<ListNode>()
      
    while head != nil {
      if !hashset.insert(head!).inserted {
        return true
      }
      head = head?.next
    }
    return false
  }
}
