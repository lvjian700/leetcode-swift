//: [Previous](@previous)

import Foundation

/*:
 ## 7. Counting elements
 <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/528/week-1/3289/>
 
 */

class Solution {
    func countElements(_ arr: [Int]) -> Int {
      guard arr.count > 1 else {
        return 0
      }
      
      let compareWith = Set(arr)
      
      var ret = 0

      for n in arr {
        if compareWith.contains(n + 1) {
          ret += 1
        }
      }
      
      return ret
    }
}


/*
 Output: 2
 Explanation: 1 and 2 are counted cause 2 and 3 are in arr.
 */
Solution().countElements([1,2,3])

/*
 Output: 0
 Explanation: No numbers are counted, cause there's no 2, 4, 6, or 8 in arr.
 */
Solution().countElements([1,1,3,3,5,5,7,7])

/*
 Output: 3
 Explanation: 0, 1 and 2 are counted cause 1, 2 and 3 are in arr.
 */
Solution().countElements([1,3,2,3,5,0])

/*
 Output: 2
 Explanation: Two 1s are counted cause 2 is in arr.
 */
Solution().countElements([1,1,2,2])

//: [Next](@next)
