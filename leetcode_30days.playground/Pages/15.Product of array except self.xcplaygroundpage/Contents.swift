//: [Previous](@previous)

import Foundation

/*:
 ## Product of Array Except Self
 <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3300/>
 
 ```
 Input:  [1,2,3,4]
 Output: [24,12,8,6]
 ```
 */

/*
 [1,1,1,1]
 
 */
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
      var ret = Array<Int>(repeating: 1, count: nums.count)
      
      for tIndex in stride(from: 1, to: nums.count, by: 1) {
          ret[tIndex] = ret[tIndex - 1] * nums[tIndex - 1]
      }

      var backwards = 1

      for bIndex in stride(from: nums.count - 1, through: 0, by: -1) {
          ret[bIndex] = ret[bIndex] * backwards
          backwards *= nums[bIndex]
      }
      
      return ret
    }
}

Solution().productExceptSelf([1,2,3,4])
Solution().productExceptSelf([0,2,3,4])
Solution().productExceptSelf([0,0,3,4])

//: [Next](@next)
