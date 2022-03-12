
import Foundation


func lengthOfLongestSubstring(_ s: String) -> Int {
    var set: Set = Set<Character>()
    let characters = Array(s)//转为字符数组
    var results: Int = 0
    var i: Int = 0
    var j: Int = 0
    while i < s.count && j < s.count {
        if !set.contains(characters[j]) {
            set.insert(characters[j])
            j += 1
            results = max(results, j - i)
        } else {
            set.remove(characters[i])
            i += 1
        }
    }
    return results
}

/**
 题目描述
 给定一个数组arr，返回arr的最长无的重复子串的长度(无重复指的是所有数字都不相同)。
 
 示例1
 输入[2,3,4,5]
 返回值
 4
 
 示例2
 输入[2,2,3,4,3]
 返回值
 3
 */
func maxLength ( _ arr: [Int]) -> Int {
    // write code here
    guard arr.count > 0 else {
        return 0
    }
    var set: Set = Set<Int>()
    var result: Int = 0
    var i = 0
    var j = 0
    while i < arr.count && j < arr.count {
        if !set.contains(arr[j]) {
            set.insert(arr[j])
            j = j + 1
            result = max(result, j - i)
        } else {
            set.remove(arr[i])
            i = i + 1
        }
    }
    return result
}
