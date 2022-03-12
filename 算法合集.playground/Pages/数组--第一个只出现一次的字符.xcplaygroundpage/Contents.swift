/**
 题目：第一个只出现一次的字符
 在字符串 s 中找出第一个只出现一次的字符。如果没有，返回一个单空格。 s 只包含小写字母。
 
 示例:

 s = "abaccdeff"
 返回 "b"

 s = ""
 返回 " "
 */
import Foundation

//字典实现空间换时间
func firstUniqChar(_ s: String) -> Character {
    guard s.count > 0 else {
        return " "
    }
    var dict = [Character: Int]()
    for c in s {
        if let count = dict[c] {
            dict[c] = count + 1
        } else {
            dict[c] = 1
        }
    }
    for c in s {
        if let count = dict[c], count == 1 {
            return c
        }
    }
    return " "
}


