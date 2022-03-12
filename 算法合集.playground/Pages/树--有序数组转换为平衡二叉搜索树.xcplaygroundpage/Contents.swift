
/**
 题目：给你一个数组，按照二叉搜索树进行排序？ 将有序数组转换为二叉搜索树 【将一个按照升序排列的有序数组，转换为一棵高度平衡二叉搜索树。】
 
 一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。
 
 示例:

 给定有序数组: [-10,-3,0,5,9],

 一个可能的答案是：[0,-3,9,-10,null,5]，它可以表示下面这个高度平衡二叉搜索树：

       0
      / \
    -3   9
    /   /
  -10  5
 
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

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    guard nums.count > 0 else {return nil}
    return goBST(nums, 0, nums.count-1)
}

func goBST(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
    if left > right {return nil}
    let mid = left + (right - left)/2
    let node = TreeNode(nums[mid])
    node.left = goBST(nums,left,mid-1)
    node.right = goBST(nums,mid+1,right)
    return node
}
