
import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.count > 0 else {return []}
    var dic:[Int:Int] = [Int:Int]()
    
    for i in 0..<nums.count {
        let result = target - nums[i]
        if let key = dic[result]{
            return [i,key]
        }
        dic[nums[i]] = i
    }
    return [0]
}
