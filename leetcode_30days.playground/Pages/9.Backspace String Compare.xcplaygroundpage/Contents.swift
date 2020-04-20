//: [Previous](@previous)

import Foundation

/*:
 ## Backspace String Compare

 <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3291/>
 
 Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.

 > Note that after backspacing an empty text, the text will continue empty.
 
 
 ```
 Input: S = "ab#c", T = "ad#c"
 Output: true
 Explanation: Both S and T become "ac".
 
 Input: S = "ab##", T = "c#d#"
 Output: true
 Explanation: Both S and T become "".
 
 Input: S = "a##c", T = "#a#c"
 Output: true
 Explanation: Both S and T become "c".
 
 Input: S = "a#c", T = "b"
 Output: false
 Explanation: S becomes "c" while T becomes "b".
 ```
 
 ### Limitation
 
 > - 1 <= S.length <= 200
 > - 1 <= T.length <= 200
 > - S and T only contain lowercase letters and '#' characters.
 */
class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
      guard S != T else {
        return true
      }

      return applyBackspace(S) == applyBackspace(T)
    }
  
  private func applyBackspace(_ str: String) -> String {
    var stack = ""

    for c in str {
      if c != "#" {
        stack.append(c)
      } else {
        stack.popLast()
      }
    }
    
    return stack
  }
}

Solution().backspaceCompare("ab#c", "ad#c")
Solution().backspaceCompare("ab##", "c#d#")
Solution().backspaceCompare("a##c", "#a#c")
Solution().backspaceCompare("a#c", "b")


//: [Next](@next)
