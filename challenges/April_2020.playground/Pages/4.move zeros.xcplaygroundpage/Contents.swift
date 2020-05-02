//: [Previous](@previous)

import Foundation

/*:
 ## Move zeros
 <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/528/week-1/3286/>
 
 > Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 > - Input: [0,1,0,3,12]
 > - Output: [1,3,12,0,0]
 
 
 > - You must do this in-place without making a copy of the array.
 > - Minimize the total number of operations.
 */

class Solution {
  func moveZeroes(_ nums: inout [Int]) {
    move(&nums, 0, 1)
  }

  /*
    [0, 1, 0, 3, 12]
    [1, 0, 0, 3, 12]
    [1, 3, 0, 0, 12]
    [1, 3, 12, 0, 0]
  */
  private func move( _ nums: inout [Int], _ currentIndex: Int, _ searchIndex: Int) -> [Int] {
    guard
      nums.count > 1,
      searchIndex < nums.count
    else {
      return nums
    }
    
    if nums[currentIndex] != 0 {
      return move(&nums, currentIndex + 1, searchIndex + 1)
    }

    if (nums[searchIndex] != 0) {
      nums.swapAt(currentIndex, searchIndex)
      return move(&nums, currentIndex + 1, searchIndex + 1)
    }
    
    return move(&nums, currentIndex, searchIndex + 1)
  }
}

var array = [0, 1, 0, 3, 12]
Solution().moveZeroes(&array)
//: [Next](@next)
