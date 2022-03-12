/**
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。

 注意：答案中不可以包含重复的三元组。

  

 示例 1：

 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
 示例 2：

 输入：nums = []
 输出：[]
 示例 3：

 输入：nums = [0]
 输出：[]
  

 提示：

 0 <= nums.length <= 3000
 -105 <= nums[i] <= 105
 */

import Foundation


func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 2 else {return []}
    let numsArr = nums.sorted()
    var resultArr = [[Int]]()
    for i in 0..<numsArr.count {
        if i > 0 && numsArr[i] == numsArr[i-1] {continue}
        let target = 0 - numsArr[i]
        var low = i + 1
        var high = numsArr.count - 1
        while low < high {
            let sum = numsArr[low] + numsArr[high]
            if target == sum {
                let result = [numsArr[i], numsArr[low], numsArr[high]]
                resultArr.append(result)
                while low < high && numsArr[low] == numsArr[low+1] {
                    low = low + 1
                }
                while low < high && numsArr[high] == numsArr[high-1] {
                    high = high - 1
                }
                low = low + 1
                high = high - 1
            } else if target < sum {
                high = high - 1
            } else {
                low = low + 1
            }
        }
    }
    return resultArr
    
}

