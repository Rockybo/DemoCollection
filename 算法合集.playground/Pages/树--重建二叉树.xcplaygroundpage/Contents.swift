/**
 题目：
 输入某二叉树的前序遍历和中序遍历的结果，请重建出该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。例如输入前序遍历序列{1,2,4,7,3,5,6,8}和中序遍历序列{4,7,2,1,5,3,8,6}，则重建二叉树并返回。
 
 示例1
 输入
 [1,2,3,4,5,6,7],[3,2,4,1,6,5,7]
 
 返回值
 
 {1,2,5,3,4,6,7}
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


func reConstructBinaryTree ( _ pre: [Int],  _ vin: [Int]) -> TreeNode? {
    // write code here
    if pre.count <= 0 {
        return nil
    }
    //! 前序遍历的首元素自然是根节点
    let root = TreeNode.init(pre[0])
    
    //! 遍历中序遍历，找到root在 vin 的位置
    var middleNodeIndex = 0
    
    while middleNodeIndex < vin.count {
        if vin[middleNodeIndex] == pre[0] {
            break
        }
        middleNodeIndex += 1
    }
    
    //! 将中序遍历的数组分割，左右两边分别是 root 的左右子树 A 和 B 的中序遍历数组
    let leftNodevin = Array(vin[..<middleNodeIndex])
    let rightNodevin = Array(vin[middleNodeIndex+1..<vin.endIndex])
    
    //! 1. 将前序遍历的数组进行分割，很明显，我们可以通过得到 A 和 B 的数组长度，
    //! 2. 对前序数组进行分割，分别拿到 A B 子树的前序数组
    let leftNodepre = Array(pre[1..<leftNodevin.count+1])
    let rightNodepre = Array(pre[leftNodepre.count+1..<pre.endIndex])
    
    root.left = reConstructBinaryTree(leftNodepre,leftNodevin)
    root.right = reConstructBinaryTree(rightNodepre,rightNodevin)
    return root
}
