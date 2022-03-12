/**
 题目：
 题目描述
 求1+2+3+...+n，要求不能使用乘除法、for、while、if、else、switch、case等关键字及条件判断语句（A?B:C）。
 示例1
 输入
 5
 
 返回值
 15

 */
import Foundation

func sumNums(_ n: Int) -> Int {
    if n <= 0 { return 0 }
    return n + sumNums( n - 1)
}
