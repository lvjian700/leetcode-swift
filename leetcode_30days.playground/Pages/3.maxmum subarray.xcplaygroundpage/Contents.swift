//: [Previous](@previous)

import Foundation

/*:
 1. Change to recursive sulotion
 2. Divide & conquer
 */

class Solution {
  func maxSubArray(_ nums: [Int]) -> Int {
    return findMax(nums, startAt: 1,
                      currentSum: nums[0],
                      currentMax: nums[0])
  }
  
  private func findMax(_ nums: [Int], startAt index: Int, currentSum: Int, currentMax: Int) -> Int {
    guard nums.count > 1 else {
      return nums[0]
    }
    
    guard index < nums.endIndex else {
      return currentMax
    }
    
    let item = nums[index]
    let sum = max(currentSum + item, item)
    let maxNum = max(currentMax, sum)

    return findMax(nums, startAt: index + 1,
                      currentSum: sum,
                      currentMax: maxNum)
  }
}

let array = [-2,1,-3,4,-1,2,1,-5,4]
Solution().maxSubArray(array)

//: [Next](@next)
