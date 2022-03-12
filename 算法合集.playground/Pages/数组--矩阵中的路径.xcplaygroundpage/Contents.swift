/**
 题目描述
 请设计一个函数，用来判断在一个矩阵中是否存在一条包含某字符串所有字符的路径。路径可以从矩阵中的任意一个格子开始，每一步可以在矩阵中向左，向右，向上，向下移动一个格子。如果一条路径经过了矩阵中的某一个格子，则该路径不能再进入该格子。 例如

 ​    
   矩阵中包含一条字符串"bcced"的路径，但是矩阵中不包含"abcb"路径，因为字符串的第一个字符b占据了矩阵中的第一行第二个格子之后，路径不能再次进入该格子。

 示例1
 输入

 复制
 [[a,b,c,e],[s,f,c,s],[a,d,e,e]],"abcced"
 返回值

 复制
 true
 */
import Foundation


func exist(_ board: [[Character]], _ word: String) -> Bool {
    var board = board
    let word = Array(word)
    for ( row, array ) in board.enumerated() {
        for (col, _ ) in array.enumerated() {
            if BFS(&board, word, row, col, 0) {
                return true
            }
        }
    }
    return false
}

func BFS(_ board: inout [[Character]], _ word: [Character], _ row: Int, _ col: Int, _ k: Int)  -> Bool {
    if row < 0 || row >= board.count
        || col < 0 || col >= board[0].count
        || board[row][col] != word[k] { return false}
    if k == word.count - 1 { return true}
    board[row][col] = " "
    // 上 || 下 || 左 || 右
    let next = BFS(&board, word, row-1, col, k+1) || BFS(&board, word, row+1, col, k+1)
        || BFS(&board, word, row, col-1, k+1) || BFS(&board, word, row, col+1, k+1)
    board[row][col] = word[k]
    return next
}


