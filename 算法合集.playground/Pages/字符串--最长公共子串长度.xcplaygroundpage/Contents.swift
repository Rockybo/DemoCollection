/**
 给定两个字符串 text1 和 text2，返回这两个字符串的最长 公共子序列 的长度。如果不存在 公共子序列 ，返回 0 。

 一个字符串的 子序列 是指这样一个新的字符串：它是由原字符串在不改变字符的相对顺序的情况下删除某些字符（也可以不删除任何字符）后组成的新字符串。

 例如，"ace" 是 "abcde" 的子序列，但 "aec" 不是 "abcde" 的子序列。
 两个字符串的 公共子序列 是这两个字符串所共同拥有的子序列。

 */

import Foundation

func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    let array1 = Array(text1)
    let array2 = Array(text2)
    
    var dp = Array(repeating: Array(repeating: 0, count: array2.count + 1), count: array1.count + 1)
    
    for i in 1...array1.count {
        for j in 1...array2.count {
            if array1[i - 1] == array2[j - 1]{
                dp[i][j] = dp[i-1][j-1] + 1
            } else {
                dp[i][j] = max(dp[i-1][j] ,dp[i][j-1])
            }
        }
    }
    
    return dp[array1.count][array2.count]
    
}
