/**
 题目描述
 一只青蛙一次可以跳上1级台阶，也可以跳上2级……它也可以跳上n级。求该青蛙跳上一个n级的台阶总共有多少种跳法。
 
 示例1
 输入
 3
 返回值
 4
 
 */
import Foundation

func jumpFloorII ( _ number: Int) -> Int {
    var dp = [Int]()
    for i in 0..<number+1 {
        if i == 0 {
            dp.append(1)
        }  else {
            //数学意义：在数字没有溢出的前提下，对于正数和负数，左移一位都相当于乘以2的1次，左移n位就相当于乘以2的n次方。
            dp.append(1 << (i - 1))
        }
    }
    return dp[number]
}

jumpFloorII(5)
