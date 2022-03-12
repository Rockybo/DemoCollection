/**
 题目：最大子序和
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 
 示例1：
 输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出：6
 解释：连续子数组 [4,-1,2,1] 的和最大，为6 。
 
 示例2：
 输入：nums = [1]
 输出：1
 
 
 解法一：动态规划
 核心思想：若前一个元素大于0，则将其加到当前元素上
 
 
 解法二：贪心算法
 若当前指针所指元素之前的和小于0，则丢弃当前元素之前的数列

 
 */

import Foundation

//解法一：动态规划【】
func maxSubArray(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {return 0}
    if nums.count == 1 {return nums[0]}
    var maxSum = nums[0]
    var dp = [Int]()
    dp.append(nums[0])
    for i in 1..<nums.count {
        if dp[i-1] < 0 {
            dp.append(nums[i])
        } else {
            dp.append(nums[i] + dp[i-1])
        }
        if dp[i] > maxSum {
            maxSum = dp[i]
        }
    }
    return maxSum
    
}

//解法二：贪心算法
func maxSubArray1(_ nums: [Int]) -> Int {
    if nums.count == 1 {
        return nums[0]
    }
    var maxSubArray = nums[0]
    var sum = nums[0]
    
    for i in 1..<nums.count {
        sum = sum > 0 ? sum : 0
        sum = sum + nums[i]
        maxSubArray = sum > maxSubArray ? sum : maxSubArray
    }
    
    return maxSubArray
    
}

func maxsumofSubarray ( _ arr: [Int]) -> Int {
    // write code here
    guard arr.count > 0 else {return 0}
    var sum = arr[0]
    for i in 0..<arr.count-1 {
        if sum < 0 {
            sum = arr[i]
        } else {
            sum = sum + arr[i]
        }
    }
    return sum
}
