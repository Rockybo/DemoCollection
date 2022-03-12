/**
 给定一个二叉树和一个值sum，请找出所有的根节点到叶子节点的节点值之和等于
  sum 的路径，
 例如：
 给出如下的二叉树，
 https://www.nowcoder.com/practice/840dd2dc4fbd4b2199cd48f2dadf930a?tpId=194&tqId=37509&rp=1&ru=%2Factivity%2Foj&qru=%2Fta%2Fjob-code-high-client%2Fquestion-ranking&tab=answerKey
 返回
 [
 [5,4,11,2],
 [5,8,9]
 ]

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


func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
    var results = [[Int]]()
    var path = [Int]()
    pathSum_recur(root, sum, &path, &results)
    return results
}

func pathSum_recur(_ root: TreeNode?, _ remain: Int, _ path: inout [Int], _ result: inout [[Int]]) {
    guard let rootValue = root?.val else { return }
    path.append(rootValue)
    let res = remain - rootValue
    if res == 0 && root?.left == nil && root?.right == nil  {
       result.append(path)
    } else {
       pathSum_recur(root?.left, res, &path, &result)
       pathSum_recur(root?.right, res, &path, &result)
    }
    
    path.removeLast()
}


