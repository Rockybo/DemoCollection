/**
 给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。

  

 进阶：你可以设计并实现时间复杂度为 O(n) 的解决方案吗？

  

 示例 1：

 输入：nums = [100,4,200,1,3,2]
 输出：4
 解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。
 示例 2：

 输入：nums = [0,3,7,2,5,8,4,6,0,1]
 输出：9
  

 提示：

 0 <= nums.length <= 104
 -109 <= nums[i] <= 109
 */
import Foundation

/**
 首先处理数组为1或着0的特殊情况，然后将数组进行排序（排序算法不符合题目的复杂度要求），定义l， r两个变量，进行窗口的滑动，如果当前元素减去上一个元素为1，则向右扩大窗口，如果遇到重复元素，则将该元素删除，并且重新更新nums的长度len = nums.size();，否则的话会造成异常，如果不符合条件，则将左边界更新为右边界，然后继续进行滑动窗口。

 
 */

func longestConsecutive(_ nums: [Int]) -> Int {
    if nums.isEmpty { return 0 }
    if nums.count == 1 { return 1 }
    var r = 1, l = 0, ans = 0, len = nums.count, nums = nums // 将数组改为可修改
    nums.sort()
    while r < len {
        if nums[r] - nums[r - 1] == 1 {
            ans = max(r - l, ans)
            r += 1
        } else if nums[r] == nums[r - 1] {
            nums.remove(at: r)
            len = nums.count
        } else {
            l = r
            r += 1
        }
    }
    return ans + 1
}


