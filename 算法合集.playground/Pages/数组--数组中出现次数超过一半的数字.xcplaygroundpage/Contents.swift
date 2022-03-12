 /**
  题目：数组中出现次数超过一半
  数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。
  你可以假设数组是非空的，并且给定的数组总是存在多数元素。
  
  示例 1:

  输入: [1, 2, 3, 2, 2, 2, 5, 4, 2]
  输出: 2
  
  */
import Foundation

/**
  解法一：投票法
  在众议院中，多党进行投票选举 当权党，一人一票且只投自己所属党派。

  假定投票区有一个黑板，可以让党员上去贴票，现在进行 公开投票选举

  每一个党员上去贴票，如果黑板空空如也，那么就把自己支持的票贴上去
  如果发现上面已经有支持票了，且支持票不是自己的党派，那么就撕了，直接下去
  如果发现上面已经有支持票了，且支持票是自己的党派，那么就把自己的票贴上去
  等所有的党员都投票结束，留下在黑板上的一定是 多数党。
  
  */
 func majorityElement(_ nums: [Int]) -> Int {
    var count = 0
    var pivot = nums[0]
    for num in nums {
        if count == 0 {
            pivot = num
        }
        count = count + ((num == pivot) ? 1 : -1)
    }
    return pivot
 }

 /**
   解法二：哈希方法
  
  使用哈希表存储元素出现的次数, 因为多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。所以在进行统计时，可以优化操作
   
   */
 func majorityElement1(_ nums: [Int]) -> Int {
    var hashMap = [Int: Int]()
    for num in nums {
        if hashMap[num] == nil {
            hashMap[num] = 1
        } else {
            if hashMap[num]! == nums.count/2 {
                return num
            } else {
                hashMap[num] = hashMap[num]! + 1
            }
        }
    }
    //没有找到，则默认输出第一个元素
    return nums[0]
 }
 

/**
  解法三：快速排序
*/
 
 
