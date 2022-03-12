/**
 题目描述
 输入一个递增排序的数组和一个数字S，在数组中查找两个数，使得他们的和正好是S，如果有多对数字的和等于S，输出两个数的乘积最小的。
 
 返回值描述:
 对应每个测试案例，输出两个数，小的先输出。
 
 示例1
 输入
 [1,2,4,7,11,15],15
 
 返回值
 [4,11]
 
 */
import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.count > 2 else {return []}
    var low = 0
    var high = nums.count - 1
    var resultArr = [Int]()
    while low <= high {
        let sum = nums[low] + nums[high]
        if sum == target {
            resultArr.append(nums[low])
            resultArr.append(nums[high])
            return resultArr
        } else if sum < target {
            low = low + 1
        } else {
            high = high - 1
        }
    }
    return []
}



//穷举法【时间超出】
func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    var resultArr = [Int]()
    for i in 0..<nums.count {
        for j in i..<nums.count {
            if nums[i] == target - nums[j] {
                resultArr.append(nums[i])
                resultArr.append(nums[j])
                return resultArr
            }
        }
    }
    return []
}
