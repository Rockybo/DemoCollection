
/**
 题目：二叉树的锯齿形层次遍历
 给定一个二叉树，返回其节点值的锯齿形层序遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。

 例如：
 给定二叉树 [3,9,20,null,null,15,7],

 3
 / \
9  20
  /  \
 15   7
 
 返回锯齿形层序遍历如下：

 [
   [3],
   [20,9],
   [15,7]
 ]
 
 */

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

import Foundation

var res: [[Int]] = []

func zigzagLevelOrderByDFS(_ root: TreeNode?) -> [[Int]] {
     levelOrderByDFS(root, 0)
    return res
}

func levelOrderByDFS(_ root: TreeNode?, _ level: Int) {
    guard root != nil && root?.val != nil else {
        return
    }
    if res.count == level {
        res.append([])
    }
    let isLeading = (level % 2 == 0)
    if isLeading {
        res[level].append(root!.val)
    } else {
        res[level].insert(root!.val, at: 0)
    }
    levelOrderByDFS(root!.left, level + 1)
    levelOrderByDFS(root!.right, level + 1)
}


//解法二：队列的方式
func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let first = root else { return [] }
    
    var queue = [first]
    var levels = [[Int]]()
    var isReverse = true
    
    while !queue.isEmpty {
        isReverse = !isReverse
        var level = [Int]() // 当前层
        
        for _ in 0 ..< queue.count {
            let top = queue.removeFirst()
            level.append(top.val)
            
            if let left = top.left {
                queue.append(left)
            }
            if let right = top.right {
                queue.append(right)
            }
        }
        
        levels.append(isReverse ? level.reversed() : level)
    }
    
    return levels
}
