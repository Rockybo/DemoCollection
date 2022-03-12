/**
 题目描述
 我们可以用2*1的小矩形横着或者竖着去覆盖更大的矩形。请问用n个2*1的小矩形无重叠地覆盖一个2*n的大矩形，总共有多少种方法？

 比如n=3时，2*3的矩形块有3种覆盖方法：
 
 https://uploadfiles.nowcoder.com/images/20201028/59_1603852524038_7FBC41C976CACE07CB222C3B890A0995
 
 示例1
 输入
 4
 
 返回值
 5

 */


import Foundation

func rectCover ( _ number: Int) -> Int {
    var dp = [Int]()
    dp.append(0)
    for  i in 1..<number+1 {
        if i == 1 {
            dp.append(1)
        } else if i == 2 {
            dp.append(2)
        } else {
            dp.append(dp[i-1] + dp [i-2])
        }
    }
    return dp[number]
    
}
