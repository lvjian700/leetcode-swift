//: [Previous](@previous)

import Foundation

/*:
 ## Contiguous Array
 <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3298/>
 
 Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1.
 
 ```
 Input: [0,1]
 Output: 2
 Explanation: [0, 1] is the longest contiguous subarray with equal number of 0 and 1.
 ```
 
 ```
 Input: [0,1,0]
 Output: 2
 Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
 ```
 */
class Solution {

  func findMaxLength(_ nums: [Int]) -> Int {
    var map: [Int: Int] = [:]
    map[0] = -1
    
    var maxlen = 0, count = 0

    for (i, num) in nums.enumerated() {
      count = count + (num == 1 ? 1 : -1);

      if let index = map[count] {
        maxlen = max(maxlen, i - index)
      } else {
        map[count] = i
      }
    }
    
    return maxlen
  }
}

Solution().findMaxLength([0, 1])
Solution().findMaxLength([0, 1, 0])
Solution().findMaxLength([0, 1, 0, 1])
Solution().findMaxLength([0, 1, 1, 0])
Solution().findMaxLength([0,0,0,1,1,1,0])
Solution().findMaxLength([0,1,0,0,1,1,0])
//: [Next](@next)
