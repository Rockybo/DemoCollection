/**
 题目：平衡二叉树
 
 输入一棵二叉树的根节点，判断该树是不是平衡二叉树。如果某二叉树中任意节点的左右子树的深度相差不超过1，那么它就是一棵平衡二叉树。
 
 示例 1:
 给定二叉树 [3,9,20,null,null,15,7]

     3
    / \
   9  20
     /  \
    15   7
 返回 true
 
 
 示例2
 给定二叉树 [1,2,2,3,3,null,null,4,4]

        1
       / \
      2   2
     / \
    3   3
   / \
  4   4
 返回 false
 
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

func isBalanced(_ root: TreeNode?) -> Bool {
    guard let root = root else {
        return true
    }
    
    return isBalanced(root.left) && isBalanced(root.right) && abs(maxDepth(root.left) - maxDepth(root.right)) <= 1
}

func maxDepth(_ root:TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    return max(maxDepth(root.left), maxDepth(root.right)) + 1
}
