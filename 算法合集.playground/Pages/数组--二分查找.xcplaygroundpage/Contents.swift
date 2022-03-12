/**
 二分查找
 
 给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target  ，写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1。

 示例1：
 输入: nums = [-1,0,3,5,9,12], target = 9
 输出: 4
 解释: 9 出现在 nums 中并且下标为 4
 
 示例2：
 输入: nums = [-1,0,3,5,9,12], target = 2
 输出: -1
 解释: 2 不存在 nums 中因此返回 -1
  
 */

import Foundation

//day1
let nums = [-1,0,3,5,9,12]

func search(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 0 else {return -1}
    var low = 0
    var high = nums.count - 1
    while low <= high {
        let mid = low + (high - low)/2
        if nums[mid] == target {
            return mid
        }
        if nums[mid] < target {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    return -1
}

let result = search(nums, 5)
print(result)
