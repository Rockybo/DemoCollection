/**
 题目描述
 从上往下打印出二叉树的每个节点，同层节点从左至右打印。
 
 示例1
 输入
 {5,4,#,3,#,2,#,1}
 
 返回值
 [5,4,3,2,1]
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
func levelOrder(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return [Int]()
    }
    var queue = [TreeNode]()
    queue.append(root!)
    var result = [Int]()
    while queue.count > 0 {
        let node = queue.first!
        queue.removeFirst()
        result.append(node.val)
        if node.left != nil {
            queue.append(node.left!)
        }
        if node.right != nil {
            queue.append(node.right!)
        }
    }
    return result
}

