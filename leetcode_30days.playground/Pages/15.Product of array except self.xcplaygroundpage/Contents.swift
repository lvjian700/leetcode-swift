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
      var towards = Array<Int>(repeating: 1, count: nums.count)
      var backwards = Array<Int>(repeating: 1, count: nums.count)
      var ret = Array<Int>(repeating: 1, count: nums.count)
      
      for tIndex in (1...nums.count - 1) {
          towards[tIndex] = towards[tIndex - 1] * nums[tIndex - 1]
      }
      
      for bIndex in stride(from: nums.count - 2, to: -1, by: -1) {
          backwards[bIndex] = backwards[bIndex + 1] * nums[bIndex + 1]
      }
      
      for i in (0...nums.count - 1) {
        ret[i] = towards[i] * backwards[i]
      }
      
      return ret
    }
}

Solution().productExceptSelf([1,2,3,4])
Solution().productExceptSelf([0,2,3,4])
Solution().productExceptSelf([0,0,3,4])

//: [Next](@next)
