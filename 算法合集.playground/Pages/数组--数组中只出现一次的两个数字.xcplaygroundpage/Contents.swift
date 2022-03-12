/**
  题目：
 一个整型数组 nums里除两个数字之外，其他数字都出现了两次。请写程序找出这两个只出现一次的数字。要求时间复杂度是O(n)，空间复杂度是O(1)。
 
 示例 1：
 输入：nums = [4,1,4,6]
 输出：[1,6] 或 [6,1]
 
 */
import Foundation

func singleNumbers1(_ nums: [Int]) ->[Int] {
    var hashMap = [Int : Int]()
    var res = [Int]()
    for item in nums {
        if hashMap.keys.contains(item) {
            hashMap.removeValue(forKey: item)
        } else {
            hashMap.updateValue(1, forKey: item)
        }
    }
    
    for (key, _) in hashMap {
        res.append(key)
    }
    
    return res
    
}

