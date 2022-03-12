/**
 
 题目：二叉树的最近公共祖先
 
 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。
 
 题解： 采用递归的方式来求解，深度遍历
 
 
 */


import Foundation

class TreeNode{
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    if root == nil || root === p || root === q {
        return root
    }
    let leftNode = lowestCommonAncestor(root?.left,p,q)
    let rightNode = lowestCommonAncestor(root?.right,p,q)
    
    if leftNode != nil && rightNode != nil {
        return root
    }
    return (leftNode != nil) ? leftNode : rightNode
}
