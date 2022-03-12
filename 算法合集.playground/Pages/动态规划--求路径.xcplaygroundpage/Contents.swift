/**
 一个机器人在m×n大小的地图的左上角（起点）。
 机器人每次向下或向右移动。机器人要到达地图的右下角（终点）。
 可以有多少种不同的路径从起点走到终点？
 
 示例1
 输入
 2,1
 
 返回值
 1
 
 思路：此点的值等于左边+上面的值
 */
import Foundation

func uniquePaths ( _ m: Int,  _ n: Int) -> Int {
    var steps = [[Int]](repeating: [Int](repeating: 1, count: n), count: m)
    for mIndex in 1..<m {
        for nIndex in 1..<n {
            steps[mIndex][nIndex] = steps[mIndex-1][nIndex] + steps[mIndex][nIndex-1]
        }
    }
    return steps[m-1][n-1]
}
