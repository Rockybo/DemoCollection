/**
 题目描述
 从0,1,2,...,n这n+1个数中选择n个数，找出这n个数中缺失的那个数，要求O(n)尽可能小。
 示例1
 输入
 [0,1,2,3,4,5,7]
 
 返回值
 6
 */

import Foundation

func missingNumber(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    while left <= right {
        let mid = left + ((right - left) >> 1)
        if nums[mid] == mid {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return left
}

func missingNumber1(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    
    for i in 0..<nums.count {
        
        if i != nums[i] {
            return i
        }
    }
    
    return nums.count
}


