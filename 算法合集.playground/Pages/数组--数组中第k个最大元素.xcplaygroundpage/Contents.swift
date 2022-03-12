/**
 
 */
import Foundation


func findKth ( _ a: [Int],  _ n: Int,  _ K: Int) -> Int {
    var nums = a
    quickSort(&nums, left: 0, right: n - 1)
    return nums[n - K]
}

func quickSort(_ nums: inout [Int], left: Int, right: Int){
    if left >= right { return }
    var l = left
    var r = right
    let key = nums[l]
    
    while l < r {
        while l < r && nums[r] >= key {
            r -= 1
        }
        nums[l] = nums[r]
        
        while l < r && nums[l] <= key {
            l += 1
        }
        nums[r] = nums[l]
    }
    nums[l] = key
    quickSort(&nums, left: left, right: l - 1)
    quickSort(&nums, left: l + 1, right: right)
}
