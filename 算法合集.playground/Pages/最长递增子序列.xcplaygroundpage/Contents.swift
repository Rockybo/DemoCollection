/**
 题目描述
 给定数组arr，设长度为n，输出arr的最长递增子序列个数。（如果有多个答案，请输出其中字典序最小的）
 
 示例1
 输入 [2,1,5,3,6,4,8,9,7]
 返回值
 [1,3,4,8,9]
 
 
 示例2
 输入 [1,2,8,6,4]
 返回值
 [1,2,4]
 */
import Foundation

func lengthOfLIS(_ nums: [Int]) -> Int {
    let count = nums.count
    if count <= 1 {
        return count
    }
    var dp = Array(repeating: 1, count: count)
    var res = 1;
    for i in 1..<count {
        for j in 0..<i {
            if nums[i] > nums[j] {
                dp[i] = max(dp[i],dp[j] + 1)
            }
        }
        res = max(res,dp[i])
    }
    return res
}


