/**
 题目：俄罗斯套娃信封问题
 
 给你一个二维整数数组 envelopes ，其中 envelopes[i] = [wi, hi] ，表示第 i 个信封的宽度和高度。

 当另一个信封的宽度和高度都比这个信封大的时候，这个信封就可以放进另一个信封里，如同俄罗斯套娃一样。

 请计算 最多能有多少个 信封能组成一组“俄罗斯套娃”信封（即可以把一个信封放到另一个信封里面）。

 注意：不允许旋转信封。
 
 
 
 */


import Foundation

let nums = [[2, 3], [4, 5], [6, 6], [6, 7]]
maxEnvelopes(nums)

func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
    if envelopes.count == 0 { return 0 }
    var temp = envelopes
    temp = temp.sorted { (a, b) -> Bool in
        if a[0] == b[0]{
            return a[1] > b[1]
        }
        return a[0] < b[0]
    }
    print(temp)
    var f = Array.init(repeating: 1, count: temp.count)
    for i in 0..<temp.count  {
        for j in 0..<i {
            if(temp[i][1] > temp[j][1]) {
                f[i] = max(f[i], f[j]+1)
            }
        }
    }
    return f.max() ?? 1
}


