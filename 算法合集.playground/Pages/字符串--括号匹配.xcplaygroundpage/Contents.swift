 // 括号匹配
 /**
  给出一个仅包含字符'(',')','{','}','['和']',的字符串，判断给出的字符串是否是合法的括号序列
  括号必须以正确的顺序关闭，"()"和"()[]{}"都是合法的括号序列，但"(]"和"([)]"不合法。
  
  */
import Foundation

 
 var hashMap: [String: String] = [")": "(", "}": "{", "]": "["]
 
 func isValid ( _ s: String) -> Bool {
    // write code here
    if s.count % 2 == 1 {
        return false
    }
    var stack: [String] = []
    for i in s {
        if i == "(" || i == "[" || i == "{" {
            stack.append("\(i)")
        } else {
            let leftValue = stack.popLast()
            let value = hashMap["\(i)"]
            if leftValue != value {
                return false
            }
        }
    }
    return stack.isEmpty
 }
