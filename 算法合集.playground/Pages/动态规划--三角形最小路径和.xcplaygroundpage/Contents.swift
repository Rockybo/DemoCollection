
/**
 题目： 三角形最小路径和
 给定一个三角形 triangle ，找出自顶向下的最小路径和。

 每一步只能移动到下一行中相邻的结点上。相邻的结点 在这里指的是 下标 与 上一层结点下标 相同或者等于 上一层结点下标 + 1 的两个结点。也就是说，如果正位于当前行的下标 i ，那么下一步可以移动到下一行的下标 i 或 i + 1 。
 
 示例1：
 输入：triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
 输出：11
 解释：如下面简图所示：
    2
   3 4
  6 5 7
 4 1 8 3
 自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
 
 动态规划： 讲解比较好的方式
 https://www.bilibili.com/video/BV1pk4y1B7th?from=search&seid=12174766897902671012
 
 */


import Foundation

func minimumTotal(_ triangle: [[Int]]) -> Int {
    
    let count = triangle.count
    var dp = [[Int]](repeating: [Int](repeating: 0, count: count + 1), count: count + 1)
    for i in (0...(count-1)).reversed() {
        for j in 0...i {
            //这是相当于直接加数据，往数组里面
//            dp[i].append((min(dp[i+1][j],dp[i+1][j+1])) + triangle[i][j])
            // 数组已经赋值过了,所以不应该添加数据，而应该直接覆盖数据
            dp[i][j] = min(dp[i+1][j],dp[i+1][j+1]) + triangle[i][j]

        }
    }
    return dp[0][0]
}


let result = minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]])
print(result)


func minimumTotal1(_ triangle: [[Int]]) -> Int {
    let count = triangle.count
    var dp = [Int](repeating: 0, count: count+1)
    for i in (0...(count-1)).reversed() {
        for j in 0...i {
            dp[j] = min(dp[j],dp[j+1]) + triangle[i][j]
        }
    }
    return dp[0]
}
