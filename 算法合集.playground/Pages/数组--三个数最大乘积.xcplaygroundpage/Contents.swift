/**
 题目描述
 给定一个无序数组，包含正数、负数和0，要求从中找出3个数的乘积，使得乘积最大，要求时间复杂度：O(n)，空间复杂度：O(1)。
 
 示例1
 输入
 [3,4,1,2]
 
 返回值
 24
 */

import Foundation


func maximumProduct(_ nums: [Int]) -> Int {
    let nums = nums.sorted()
    //! 前三大元素乘积
    var maxValue = nums[nums.count-1] * nums[nums.count-2] * nums[nums.count-3]
    
    if nums[0] < 0 && nums[1] < 0 {
        //! 前面两个数都小于0 那么才计算该情况
        maxValue = max(maxValue, nums[0] * nums[1] * nums[nums.count-1])
    }
    return maxValue
}

