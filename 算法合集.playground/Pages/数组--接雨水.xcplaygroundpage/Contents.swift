
import Foundation

func trap(_ height: [Int]) -> Int {
    
    var left = 0, right = height.count - 1, ans = 0, left_max = 0, right_max = 0
    while left < right {
        if height[left] < height[right] {
            height[left] >= left_max ? (left_max = height[left]) : (ans += (left_max - height[left]))
            left += 1
        } else {
            height[right] >= right_max ? (right_max = height[right]) : (ans += right_max - height[right])
            right -= 1
        }
    }
    return ans
}


