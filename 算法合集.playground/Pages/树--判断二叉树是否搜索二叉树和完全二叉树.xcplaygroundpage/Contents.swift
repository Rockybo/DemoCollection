/**
 给定一棵二叉树，已经其中没有重复值的节点，请判断该二叉树是否为搜索二叉树和完全二叉树。
 示例1
 输入
 {2,1,3}
 
 返回值
 [true,true]
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

//通过中序遍历得到一个有序序列
var resultArr = [Int]()

func isValidBST(_ root: TreeNode?) -> Bool {
    if root == nil {
        return true
    }
    inOrder(root)
    for i in 0..<resultArr.count-1 {
        if resultArr[i] >= resultArr[i+1] {
            return false
        }
    }
    return true
}

// 中序遍历
func inOrder(_ root: TreeNode?) {
    guard let root = root else {
        return
    }
    inOrder(root.left)
    resultArr.append(root.val)
    inOrder(root.right)
}
