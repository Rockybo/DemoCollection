/**
 题目：斐波那契数列
 写一个函数，输入 n ，求斐波那契（Fibonacci）数列的第 n 项（即 F(N)）。斐波那契数列的定义如下：

 F(0) = 0,   F(1) = 1
 F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
 
 斐波那契数列由 0 和 1 开始，之后的斐波那契数就是由之前的两数相加而得出。
 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

 示例 2：
 输入：n = 5
 输出：5
 */


import Foundation


func fib(_ n: Int) -> Int {
    var a = 0
    var b = 1
    var sum = 0
    for _ in 0..<n {
        sum = ( a + b ) % 1000000007
        (a,b) = (b, sum)
    }
    return a 
}



//超时 
func fib1(_ n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    } else {
        return fib1(n-1) + fib1(n-2)
    }
}
