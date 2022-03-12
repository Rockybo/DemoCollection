 /**
  题目：
  统计一个数字在升序数组中出现的次数。
  
  输入
  复制
  [1,2,3,3,3,3,4,5],3
  
  返回值
  4
  
  */
import Foundation

 
 func GetNumberOfK ( _ data: [Int],  _ k: Int) -> Int {
    // write code here
    var count = 0
    for i in 0..<data.count {
        if data[i] == k {
            count = count + 1
        } else if data[i] > k{
            //（1）continue语句只结束本次循环，而不是终止整个循环的执行；
            //（2）break语句则是结束整个循环过程，不再判断执行循环的条件是否成立。
            break
        }
    }
    return count
 }


