/**
 给定一个二叉树，返回其按层次遍历的节点值。 （即逐层地，从左到右访问所有节点）。

 例如:

 给定二叉树: [3,9,20,null,null,15,7]
 
 输出
 [
   [3],
   [9,20],
   [15,7]
 ]
 
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

var result: [[Int]] = []

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let tree = root else { return [] }
    levelOrder(tree, level: 0)
    return result
    
}

func levelOrder(_ node: TreeNode, level: Int) {
    if result.count == level {
        result.append([node.val])
    } else {
        var temp = result[level]
        temp.append(node.val)
        result[level] = temp
    }
    
    if let left = node.left {
        levelOrder(left, level: level + 1)
    }
    
    if let right = node.right {
        levelOrder(right, level: level + 1)
    }
    
}


func levelOrder1(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    
    var result: [[Int]] = []
    var queue: [TreeNode] = [root]
    
    while !queue.isEmpty {
        var levelResult: [Int] = []
        
        for _ in 0 ..< queue.count {
            let node = queue.removeFirst()
            levelResult.append(node.val)
            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }
        }
        
        result.append(levelResult)
    }
    
    return result
}


