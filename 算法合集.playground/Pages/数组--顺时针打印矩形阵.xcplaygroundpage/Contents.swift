/**
 输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字，例如，如果输入如下4 X 4矩阵： 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 则依次打印出数字1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10.
 
 示例1
 输入
 [[1,2],[3,4]]
 
 返回值
 [1,2,4,3]
 
 */
import Foundation

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    if matrix.isEmpty {
        return []
    }
    let rows = matrix.count
    let cols = matrix[0].count
    var res = [Int]()
    var left = 0
    var right = cols - 1
    var top = 0
    var bottom = rows - 1
    
    while left <= right && top <= bottom {
        if left <= right {
            for col in left...right {
                res.append(matrix[top][col])
            }
        }
        
        if top + 1 <= bottom {
            for row in (top + 1)...bottom {
                res.append(matrix[row][right])
            }
        }
        
        
        if left < right && top < bottom {
            for col in stride(from: right - 1, to: left, by: -1) {
                res.append(matrix[bottom][col])
            }
            
            for row in stride(from: bottom, to: top, by: -1) {
                res.append(matrix[row][left])
            }
        }
        left += 1
        right -= 1
        top += 1
        bottom -= 1
        
    }
    
    return res
}

