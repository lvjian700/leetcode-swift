//: [Previous](@previous)

import Foundation


/*:
 ## Best Time to Buy and Sell Stock II
 https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/528/week-1/3287/
 
 ### Example 1
 
 - Input: [7,1,5,3,6,4]
 - Output: 7
 
 > Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
 >             Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
 
 ### Example 2
 
 - Input: [1,2,3,4,5]
 - Output: 4
 
 > Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
 >             Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
 >             engaging multiple transactions at the same time. You must sell before buying again.

 */

func showGraph(_ nums: [Int]) {
  var num = 0

  for n in nums {
    num = n
  }
}

showGraph([7,1,5,3,6,4])
showGraph([1,2,3,4,5])
showGraph([7,6,4,3,1])

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
      guard prices.count > 1 else {
        return 0
      }

      var ret = 0

      for index in (1...prices.count - 1) {
        let (sell, buy) = (prices[index], prices[index - 1])
        if sell > buy {
          ret += sell - buy
        }
      }
      
      return ret
    }
}

Solution().maxProfit([7,1,5,3,6,4])
Solution().maxProfit([1,2,3,4,5])
Solution().maxProfit([7,6,4,3,1])
//: [Next](@next)
