/**
 题目：二叉树的镜像
 
 请完成一个函数，输入一个二叉树，该函数输出它的镜像。
 例如输入：

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 
 镜像输出：

      4
    /   \
   7     2
  / \   / \
 9   6 3   1
 
 示例 1：
 输入：root = [4,2,7,1,3,6,9]
 输出：[4,7,2,9,6,3,1]

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

func mirrorTree(_ root: TreeNode?) -> TreeNode? {
    guard root != nil else {return nil}
    
    let left = mirrorTree(root?.right)
    let right = mirrorTree(root?.left)
    root?.left = left
    root?.right = right
    return root
}


