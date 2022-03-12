
/**
 题目：最大正方形
 在一个由 '0' 和 '1' 组成的二维矩阵内，找到只包含 '1' 的最大正方形，并返回其面积。
 
 思路：
 如果访问的数值为1，则最大值由左上方，左边，上边所决定的最小的值决定的。如果是0，则dp[i][j] = 0
 状态方程为：
 dp(i,j)=min(dp(i−1,j),dp(i−1,j−1),dp(i,j−1))+1
  
 */

import Foundation

func maximalSquare(_ matrix: [[Character]]) -> Int {
    guard matrix.count > 0 else { return 0 }
    var maxSide = 0
    var dp = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
    
    for i in 0 ..< matrix.count {
        for j in 0 ..< matrix[i].count {
            guard matrix[i][j] == "1" else { continue }
            if i == 0 || j == 0 {
                dp[i][j] = 1
            } else {
                dp[i][j] = min(dp[i - 1][j], dp[i - 1][j - 1], dp[i][j - 1]) + 1
            }
            maxSide = max(maxSide, dp[i][j])
        }
    }
    return maxSide * maxSide
}
