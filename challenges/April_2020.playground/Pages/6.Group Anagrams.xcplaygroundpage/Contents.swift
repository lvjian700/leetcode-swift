//: [Previous](@previous)

import Foundation

/*:
 ## Group Anagrams
 
 <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/528/week-1/3288/>

```
 Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Output:
 [
   ["ate","eat","tea"],
   ["nat","tan"],
   ["bat"]
 ]
```
 */

class Solution {
  
  private var ret: [[Character]: [String]] = [:]

  func groupAnagrams(_ strs: [String]) -> [[String]] {
    guard !strs.isEmpty else { return [[]] }

    for str in strs {
      group(str, by: str.sorted())
    }

    return Array(ret.values)
  }
  
  private func group(_ str: String, by set: [Character]) {
    if let item = ret[set] {
      ret[set] = item + [str]
    } else {
      ret[set] = [str]
    }
  }
}

Solution().groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
//: [Next](@next)
