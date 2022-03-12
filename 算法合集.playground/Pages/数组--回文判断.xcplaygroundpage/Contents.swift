
/**
 题目：回文
 给你一个整数 x ，如果 x 是一个回文整数，返回 true ；否则，返回 false 。
 
 回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。例如，121 是回文，而 123 不是。

题解1：转为字符串，一个一个比对字符串即可
 
题解2：
 // 1. 判断是否小于0 是则直接返回false
 // 2. 去取余反转数字
 // 3. 对比反转后的数字与原来数字是否相同
 
 */

import Foundation

func isPalindrome(_ x: Int) -> Bool {
    guard x >= 0 else {return false}
    var numStr = String(x)
    while numStr.count > 1 {
        guard numStr.removeLast() == numStr.removeFirst() else {return false}
    }
    return true
}


func isPalindrome1(_ x: Int) -> Bool {
    guard x >= 0 else {return false}
    var temp = x
    var reverse = 0
    while temp != 0 {
        let a = temp % 10
        temp = temp / 10
        reverse = reverse * 10 + a
    }
    return reverse == x
}

