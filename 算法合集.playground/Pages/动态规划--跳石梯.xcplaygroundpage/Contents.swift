/**
 题目：跳石阶
 一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。

 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

 示例 1：

 输入：n = 2
 输出：2
 
 示例 2：

 输入：n = 7
 输出：21
 
 */


import Foundation


func jumpFloor ( _ number: Int) -> Int {
    var dp = [Int]()
    for i in 0..<number+1 {
        if i == 0 {
            dp.append(1)
        } else if i == 1 {
            dp.append(1)
        } else {
            dp.append((dp[i-1] + dp[i-2])%1000000007)
        }
    }
    return dp[number]
}


