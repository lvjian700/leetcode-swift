//: [Previous](@previous)

import Foundation

/*:
 1. Change to recursive sulotion
 2. Divide & conquer
 */
// https://leetcode.com/submissions/detail/324196748/?from=/explore/challenge/card/30-day-leetcoding-challenge/528/week-1/3285/
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

class SolutionDivideAndConquer {
  func maxSubArray(_ nums: [Int]) -> Int {
    guard nums.count != 0 else {
      return 0
    }
    
    return findMax(nums,
              startAt: 0,
                endAt: nums.count - 1)
  }
  
  private func findMax(_ nums: [Int], startAt left: Int, endAt right: Int) -> Int{
    if left >= right {
      return nums[left]
    }

    let mid = left + (right - left) / 2

    let leftMax = findMax(nums,
                          startAt: left,
                            endAt: mid - 1)
    let rightMax = findMax(nums,
                          startAt: mid + 1,
                            endAt: right)

    var midMax = nums[mid]
    var temp = midMax
    
    for i in stride(from: mid - 1, through: left, by: -1) {
      temp += nums[i]
      midMax = max(midMax, temp)
    }
    
    temp = midMax
    
    for i in stride(from: mid + 1, through: right, by: 1) {
      temp += nums[i]
      midMax = max(midMax, temp)
    }
    
    return max(midMax, leftMax, rightMax)
  }
}

SolutionDivideAndConquer().maxSubArray(array)

//: [Next](@next)
