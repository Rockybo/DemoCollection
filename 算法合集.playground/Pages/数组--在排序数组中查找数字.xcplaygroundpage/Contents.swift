/**
 统计一个数字在排序数组中出现的次数。  

 示例 1:

 输入: nums = [5,7,7,8,8,10], target = 8
 输出: 2
 示例 2:

 输入: nums = [5,7,7,8,8,10], target = 6
 输出: 0
 */

import Foundation

func search(_ nums: [Int], _ target: Int) -> Int {
    
    var left = 0
    var right = nums.count-1
    //! 找第一个大于等于的元素
    while left<=right {
        let mid = (left+right)/2
        if nums[mid] > target {
            right = mid-1
        } else {
            left = mid+1
        }
    }
    
    // left 就是第一个大于等于的元素坐标
    // right 则是 left-1 的坐标
    var count = 0
    
    while right>=0&&nums[right] == target {
        right-=1
        count+=1
    }
    return count
}


