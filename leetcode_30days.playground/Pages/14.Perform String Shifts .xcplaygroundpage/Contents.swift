//: [Previous](@previous)

import Foundation

/*:
 ## Perform String Shifts
 <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3299/>
 
 ```
 Input: s = "abc", shift = [[0,1],[1,2]]
 Output: "cab"
 Explanation:
 [0,1] means shift to left by 1. "abc" -> "bca"
 [1,2] means shift to right by 2. "bca" -> "cab"
 ```
 
 abcd
 bcda
 cdab
 dabc
 
 dabc
 
 abc
 bca, cab
 
 
 cab
 abc
 bca
 
 ```
 Input: s = "abcdefg", shift = [[1,1],[1,1],[0,2],[1,3]]
 Output: "efgabcd"
 Explanation:
 [1,1] means shift to right by 1. "abcdefg" -> "gabcdef"
 [1,1] means shift to right by 1. "gabcdef" -> "fgabcde"
 [0,2] means shift to left by 2. "fgabcde" -> "abcdefg"
 [1,3] means shift to right by 3. "abcdefg" -> "efgabcd"
 ```
 */

class Solution {
  func stringShift(_ s: String, _ shift: [[Int]]) -> String {
    let chars = Array<Character>(s)
    let index = shiftedIndex(chars, shift)
    
    return readStr(startAt: index, from: chars)
  }
  
  private func readStr(startAt index: Int, from chars: [Character]) -> String {
    var array: [Character] = []
    var times = 0

    while times < chars.count {
      let i = (index + times) % chars.count
      array.append(chars[i])
      times += 1
    }
      
    return String(array)
  }
  
  private func shiftedIndex(_ chars: [Character], _ shift: [[Int]]) -> Int {
    var index = 0
    
    for move in shift {
      let (direction, amount) = (move[0], move[1])
      switch direction {
      case 0:
        index = (index + amount) % chars.count
      default:
        index = (index + chars.count - amount) % chars.count
      }
    }
    
    return index
  }
}

Solution().stringShift("abc", [[0,1],[1,2]])
Solution().stringShift("abcdefg", [[1,1],[1,1],[0,2],[1,3]])


//: [Next](@next)
