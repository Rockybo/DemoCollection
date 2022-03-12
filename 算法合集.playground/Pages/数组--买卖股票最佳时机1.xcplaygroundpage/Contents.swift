/**
 假设把某股票的价格按照时间先后顺序存储在数组中，请问买卖该股票一次可能获得的最大利润是多少？
 输入: [7,1,5,3,6,4]
     输出: 5
     解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
 输入: [7,6,4,3,1]
     输出: 0
     解释: 在这种情况下, 没有交易完成, 所以最大利润为0
 */


import Foundation

let num = [7,1,5,3,6,4]

//解法1：一次性：从头遍历数组，找当前最小值，每当遇到更大数值，比较差值与原先最大获利，遇到更小值，就更换min。 分析：时间复杂度O（n），空间复杂度O（1）
func maxProfit(_ num: [Int]) -> Int {
    guard num.count > 0 else { return 0 }
    var min = num[0]
    var maxMoney = 0
    for i in 0..<num.count {
        if min < num[i]  {
            maxMoney = num[i] - min > maxMoney ? num[i] - min : maxMoney
        } else {
            min = num[i]
        }
    }
    return maxMoney
}

//解法2：暴力解法----注意边界
func maxProfitStrongAction(_ num: [Int]) -> Int {
    guard num.count > 0 else { return 0 }
    var maxProfit = 0
    for i in 0..<num.count - 1 {
        for j in i+1..<num.count {
            let profit = num[j] - num[i]
            if profit > maxProfit {
                maxProfit = profit
            }
        }
    }
    return maxProfit
}


func maxMoney(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    var min = nums[0]
    var maxM = 0
    for i in 0..<nums.count {
        if min < nums[i] {
            maxM = maxM > nums[i] - min ? maxM : nums[i] - min
        } else {
            min = nums[i]
        }
    }
    return maxM
}
