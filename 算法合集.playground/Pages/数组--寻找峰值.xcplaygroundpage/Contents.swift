/**
 题目描述
 山峰元素是指其值大于或等于左右相邻值的元素。给定一个输入数组nums，任意两个相邻元素值不相等，数组可能包含多个山峰。找到索引最大的那个山峰元素并返回其索引。
 假设 nums[-1] = nums[n] = -∞。
 示例1
 输入
 [2,4,1,2,7,8,4]
 
 返回值
 5
 */

import Foundation
/**
 如果当前元素比右边大，那么这就是我们要找的第一个峰值
 如果当前元素比右边小，那么说明右边这个元素才可能是峰值，于是开始遍历下一个元素。
 */
func findPeakElement(_ nums: [Int]) -> Int {
    for i in 0..<nums.count-1 {
        if nums[i] > nums[i+1] {
            return i
        }
    }
    return nums.count - 1
}

func findPeakElement1(_ nums: [Int]) -> Int {
    return searchPeak(nums, 0, nums.count-1)
}

func searchPeak(_ nums:[Int], _ lef:Int,_ right:Int) -> Int {
    if lef == right {
        return lef
    }
    
    let mid = (lef+right)/2
    if nums[mid] > nums[mid+1] {
        return searchPeak(nums, lef, mid)
    }
    return searchPeak(nums, mid+1, right)
}

