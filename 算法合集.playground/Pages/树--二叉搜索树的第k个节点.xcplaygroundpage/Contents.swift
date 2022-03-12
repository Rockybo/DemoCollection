/**
  题目：二叉搜索树的第k个节点
 给定一棵二叉搜索树，请找出其中第k大的节点。
 
 示例 1:

 输入: root = [3,1,4,null,2], k = 1
    3
   / \
  1   4
   \
    2
 输出: 4

 示例 2:

 输入: root = [5,3,6,2,4,null,null,1], k = 3
        5
       / \
      3   6
     / \
    2   4
   /
  1
 输出: 4
 
 */
import Foundation


class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

var ks = 0
var res = 0

func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
    ks = k
    in_order(root)
    return res
}

func in_order(_ root: TreeNode?) {
    guard let root = root else { return }
    in_order(root.right)
    ks = ks - 1
    if ks == 0 {
        res = root.val
    } else if ks > 0 {
        in_order(root.left)
    }
}
