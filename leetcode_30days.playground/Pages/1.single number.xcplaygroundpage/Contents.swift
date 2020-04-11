import UIKit

/*:
 ## Single Number
 
 <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/528/week-1/3283/>
*/
let nums = [4,1,2,1,2]
let sorted = nums.sorted()


func findSingle(_ input: Array<Int>, lastIndex: Int) -> Int {
  let first = input[lastIndex]

  if lastIndex + 1 == input.count {
    return first
  }

  print(input[lastIndex + 1])
  let second = input[lastIndex + 1]
  
  if first != second {
    return first
  }

  let next = lastIndex + 2
  return findSingle(input, lastIndex: next)
}



findSingle(sorted, lastIndex: 0)
