
/**
 题目描述
 以字符串的形式读入两个数字，编写一个函数计算它们的和，以字符串形式返回。
 （字符串长度不大于100000，保证字符串仅由'0'~'9'这10种字符组成）
 
 示例1
 输入
 "1","99"
 返回值

 "100"
 说明

 1+99=10
 */

import Foundation



func addStrings(_ s: String, _ t: String) -> String {
    if s.isEmpty {
        return t
    }
    if t.isEmpty {
        return s
    }
    var arr1 = [String]()
    var arr2 = [String]()
    for c in s {
        arr1.append(String(c))
    }
    for c in t {
        arr2.append(String(c))
    }
    var index1 = arr1.count - 1
    var index2 = arr2.count - 1
    var add = false
    var result = ""
    while index1 >= 0, index2 >= 0 {
        let v1 = Int(arr1[index1]) ?? 0
        let v2 = Int(arr2[index2]) ?? 0
        let sum = v1 + v2
        result = getResult(sum, result, &add)
        index1 -= 1
        index2 -= 1
    }
    while index1 >= 0 {
        let num = Int(arr1[index1]) ?? 0
        result = getResult(num, result, &add)
        index1 -= 1
    }
    while index2 >= 0 {
        let num = Int(arr2[index2]) ?? 0
        result = getResult(num, result, &add)
        index2 -= 1
    }
    if add {
        result = "1" + result
    }
    return result
}

func getResult(_ num: Int, _ sum: String, _ add: inout Bool) -> String {
    var num = num
    var result = sum
    if add {
        num += 1
    }
    if num > 9 {
        add = true
        num = num % 10
    } else {
        add = false
    }
    result = String(num) + result
    return result
}

