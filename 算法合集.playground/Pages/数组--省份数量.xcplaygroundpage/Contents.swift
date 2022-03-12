
import Foundation


var Friend : [[Int]]!
var N = 0

func findCircleNum(_ M: [[Int]]) -> Int {
    var count = 0
    Friend = M
    N = Friend.count
    for i in 0..<N {
        for j in 0..<N {
            if Friend[i][j] == 1 {
                count += searchBFS(i,j)
            }
        }
    }
    return count
}

func searchBFS(_ x:Int,_ y:Int) -> Int {
    if Friend[x][y] == 0 && Friend[y][x] == 0 {
        return 0
    }
    //! 和岛屿问题不一样
    for i in 0..<N {
        if Friend[x][i] == 1 {
            Friend[x][i] = 0
            searchBFS(i, x)
        }
    }
    return 1
}
