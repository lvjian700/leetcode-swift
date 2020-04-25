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
  func checkValidString(_ s: String) -> Bool {
    guard s.count != 0 else {
      return true
    }

    var lessLeft = 0 // * is )
    var moreLeft = 0 // * is (
    
    for c in s {
      lessLeft += (c == "(") ? 1 : -1
      moreLeft += (c != ")") ? 1 : -1
      if moreLeft < 0 { break }

      lessLeft = max(lessLeft, 0)
    }

    return lessLeft == 0
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
Solution().checkValidString("((()))()(())(*()()())**(())()()()()((*()*))((*()*)")
//: [Next](@next)
