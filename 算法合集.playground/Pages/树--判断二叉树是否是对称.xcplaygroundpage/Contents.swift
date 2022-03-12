/**
 题目描述
 给定一棵二叉树，判断其是否是自身的镜像（即：是否对称）
 例如：下面这棵二叉树是对称的
   1
 /  \
 2    2
 / \    / \
 3 4  4  3
 下面这棵二叉树不对称。
 1
 / \
 2   2
 \    \
 3    3
 备注：
 希望你可以用递归和迭代两种方法解决这个问题
 
 输入
 {1,2,2}
 
 返回值
 true
 */
import Foundation


func isSymmetric(_ root: TreeNode?) -> Bool {
    return isMirrorTree(root?.left, root?.right)
}

func isMirrorTree(_ nodeL: TreeNode?, _ nodeR: TreeNode?) -> Bool {
    if nodeL == nil && nodeR == nil {
        return true
    }
    
    if nodeL == nil || nodeR == nil {
        return false
    }
    
    guard nodeL?.val == nodeR?.val else {
        return false
    }
    
    return isMirrorTree(nodeL?.left, nodeR?.right) && isMirrorTree(nodeL?.right, nodeR?.left)
}


