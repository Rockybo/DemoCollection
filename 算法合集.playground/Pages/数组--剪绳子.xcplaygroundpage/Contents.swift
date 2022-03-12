/**
 题目描述
 给你一根长度为n的绳子，请把绳子剪成整数长的m段（m、n都是整数，n>1并且m>1，m<=n），每段绳子的长度记为k[1],...,k[m]。请问k[1]x...xk[m]可能的最大乘积是多少？例如，当绳子的长度是8时，我们把它剪成长度分别为2、3、3的三段，此时得到的最大乘积是18。
 输入描述:
 输入一个数n，意义见题面。（2 <= n <= 60）
 返回值描述:
 输出答案。
 
 示例1
 输入
 8
 返回值
 18
 */
import Foundation

func cuttingRope(_ n: Int) -> Int {
    if n == 2 {return 1}
    if n == 3 {return 2}
    var dp = [Int](repeating: 0, count: n+1)
    dp[1] = 1
    dp[2] = 2
    dp[3] = 3
    for i in 4..<n+1 {
        for j in 1..<i/2+1 {
            dp[i] = max(dp[i-j] * dp[j], dp[i])
        }
    }
    return dp[n]
}
