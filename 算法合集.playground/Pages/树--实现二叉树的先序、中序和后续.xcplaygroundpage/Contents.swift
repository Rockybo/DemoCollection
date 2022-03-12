//: [Previous](@previous)

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

func threeOrders ( _ root: TreeNode?) -> [[Int]] {
    var pre = [Int]()
    var mid = [Int]()
    var post = [Int]()
    
    preOrder(root, &pre)
    inOrder(root, &mid)
    postOrder(root, &post)
    
    return [pre, mid, post]
}

func preOrder(_ root: TreeNode?, _ res: inout [Int]) {
    guard let root = root else { return }
    
    res.append(root.val)
    preOrder(root.left, &res)
    preOrder(root.right, &res)
}

func inOrder(_ root: TreeNode?, _ res: inout [Int]) {
    guard let root = root else { return }
    
    inOrder(root.left, &res)
    res.append(root.val)
    inOrder(root.right, &res)
}

func postOrder(_ root: TreeNode?, _ res: inout [Int]) {
    guard let root = root else { return }
    
    postOrder(root.left, &res)
    postOrder(root.right, &res)
    res.append(root.val)
}
