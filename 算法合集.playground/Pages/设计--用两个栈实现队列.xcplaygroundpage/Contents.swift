/**
 题目：用两个栈实现队列
 
 用两个栈实现一个队列。队列的声明如下，请实现它的两个函数 appendTail 和 deleteHead ，分别完成在队列尾部插入整数和在队列头部删除整数的功能。(若队列中没有元素，deleteHead 操作返回 -1 )

 示例 1：

 输入：
 ["CQueue","appendTail","deleteHead","deleteHead"]
 [[],[3],[],[]]
 输出：[null,null,3,-1]
 
 */
import Foundation

var stack1: [Int] = []
var stack2: [Int] = []

init() {
    
}

func appendTail(_ value: Int) {
    stack1.append(value)
}

func deleteHead() -> Int {
    if stack2.isEmpty {
        while let head = stack1.popLast() {
            stack2.append(head)
        }
    }
    return stack2.popLast() ?? -1
}
