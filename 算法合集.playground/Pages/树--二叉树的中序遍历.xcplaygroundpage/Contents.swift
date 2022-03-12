
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

//递归写法
func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    inorder(root, &res)
    return res
}

func inorder(_ root: TreeNode?, _ res: inout [Int]) {
    guard let root = root else {
        return
    }
    inorder(root.left, &res)
    res.append(root.val)
    inorder(root.right, &res)
}

//非递归算法
func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var stack = [TreeNode]()
    var result = [Int]()
    var p = root
    while p != nil {
        while p?.left != nil {//只要有左子树，就加进栈里
            stack.append(p!)
            p = p?.left
        }
        result.append(p!.val)  //没有左子树，就加入到数组中，然后开始访问他的右子树
        while p?.right == nil {//没有右子树
            if stack.count > 0 {
                p = stack.last! //出栈的每个元组，都是访问右子树
                stack.removeLast()//
                result.append(p!.val)
            } else {
                break
            }
        }
        p = p?.right //有右子树
    }
    return result
}


