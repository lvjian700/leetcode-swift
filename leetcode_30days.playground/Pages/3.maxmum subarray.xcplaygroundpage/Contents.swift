//: [Previous](@previous)

import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
          return nums[0]
        }

        var ret = nums[0]
        var currentSum = nums[0]

        for i in 1..<nums.count {
          currentSum = max(currentSum + nums[i], nums[i])
          ret = max(ret, currentSum)
        }

        return ret
    }
}

let array = [-2,1,-3,4,-1,2,1,-5,4]
Solution().maxSubArray(array)

//: [Next](@next)
