/**
 在一个二维数组中（每个一维数组的长度相同），每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。
 [
   [1,2,8,9],
   [2,4,9,12],
   [4,7,10,13],
   [6,8,11,15]
 ]
 给定 target = 7，返回 true。
 给定 target = 3，返回 false。
 
 示例1：
 
 7,[[1,2,8,9],[2,4,9,12],[4,7,10,13],[6,8,11,15]]
 返回值

 true
 说明
 存在7，返回true
 
 */
import Foundation


func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
    if matrix.count == 0 {
        return false
    }
    
    let rows = matrix.count
    let columns = matrix.first!.count
    
    var row = 0
    var column = columns - 1
    
    while row < rows && column >= 0 {
        let number = matrix[row][column]
        if number == target {
            return true
        } else if target > number {
            row = row + 1
        } else if target < number {
            column = column - 1
        }
    }
    return false
}

