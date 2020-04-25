//: [Previous](@previous)

import Foundation

/*:
 ## Valid Parenthesis String
 <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3301/>
 
 Given a string containing only three types of characters: '(', ')' and '*', write a function to check whether this string is valid. We define the validity of a string by these rules:

 1. Any left parenthesis '(' must have a corresponding right parenthesis ')'.
 2. Any right parenthesis ')' must have a corresponding left parenthesis '('.
 3. Left parenthesis '(' must go before the corresponding right parenthesis ')'.
 4. '*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string.
 5. An empty string is also valid.
 
 ```
 Input: "()"
 Output: True
 
 Input: "(*)"
 Output: True
 
 Input: "(*))"
 Output: True
 ```

 > The string size will be in the range [1, 100].
 */
class Solution {
  private let map: [Character: Int] = [
    "(" : 1,
    ")" : -1,
    "*" : 0
  ]

  func checkValidString(_ s: String) -> Bool {
      return valid(Array(s), index: 0, initVal: 0) == 0
  }
  
  private func valid(_ chars: [Character], index: Int, initVal: Int = 0) -> Int {
    guard index < chars.count, chars.count != 0 else {
      return initVal
    }

    guard
      let first = chars.first, map[first] != -1,
      let last = chars.last, map[last] != 1
    else {
      return 1
    }

    let current = map[chars[index]]!
    
    if current != 0 {
      return valid(chars, index: index + 1, initVal: initVal + current)
    }

    let left = valid(chars, index: index + 1, initVal: initVal + 1)
    let middle = valid(chars, index: index + 1, initVal: initVal)
    let right = valid(chars, index: index + 1, initVal: initVal + -1)

    return left * middle * right
  }
}

Solution().checkValidString("")
Solution().checkValidString("*")
Solution().checkValidString("(")
Solution().checkValidString(")")
Solution().checkValidString(")(")
Solution().checkValidString("()")
Solution().checkValidString("(()")
Solution().checkValidString("())")
Solution().checkValidString("(*))")
Solution().checkValidString("**))")
Solution().checkValidString("(()*")

// Crash
//Solution().checkValidString("((()))()(())(*()()())**(())()()()()((*()*))((*()*)")
//: [Next](@next)
