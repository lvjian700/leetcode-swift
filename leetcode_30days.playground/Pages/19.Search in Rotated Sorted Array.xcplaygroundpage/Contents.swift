//: [Previous](@previous)

import Foundation

/*:
 ## Search in Rotated Sorted Array
 <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3304/>
 
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

 You are given a target value to search. If found in the array return its index, otherwise return -1.

 You may assume no duplicate exists in the array.

 Your algorithm's runtime complexity must be in the order of O(log n).
 
 */



/*
 0　　1　　2　　 4　　5　　6　　7

 7　　0　　1　　 2　　4　　5　　6

 6　　7　　0　　 1　　2　　4　　5

 5　　6　　7　　 0　　1　　2　　4

 4　　5　　6　　7　　0　　1　　2

 2　　4　　5　　6　　7　　0　　1

 1　　2　　4　　5　　6　　7　　0
 */
class Solution {
  func search(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count != 0 else {
      return -1
    }
    
    var left = 0, right = nums.count - 1

    while left <= right {
      let mid = left + (right - left)/2
      if nums[mid] == target { return mid }

      if(nums[mid] < nums[right]) {// right part ordered
        if (target > nums[mid] && target <= nums[right]) { // Is target in right part?
          left = mid + 1
        } else {
          right = mid - 1
        }
      } else { // left part ordered
        if (target >= nums[left] && target < nums[mid]) {
          right = mid - 1
        } else {
          left = mid + 1
        }
      }
    }

    return -1
  }
}

Solution().search([4,5,6,7,0,1,2], 0) // 4
Solution().search([4,5,6,7,0,1,2], 3) // -1

//: [Next](@next)
