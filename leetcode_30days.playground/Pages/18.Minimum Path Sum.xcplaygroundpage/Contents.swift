//: [Previous](@previous)

import Foundation

/*:
 ## Minimum Path Sum
 <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3303/>
 
 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

 > You can only move either down or right at any point in time.
 
 ```
 Input:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 Output: 7
 Explanation: Because the path 1→3→1→1→1 minimizes the sum.
 ```
 */

let input = [
  [1,3,1],
  [1,5,1],
  [4,2,1]
]

class Solution {
  func minPathSum(_ grid: [[Int]]) -> Int {
    guard grid.count > 0 && grid[0].count > 0 else {
      return 0
    }
    
    var mutated = grid
    for (y, row) in grid.enumerated() {
      for (x, cell) in row.enumerated() {
        switch (x, y) {
        case (0, 0):
          continue
        case (_, 0):
          let left = mutated[y][x-1]
          mutated[y][x] = left + cell
        case (0, _):
          let top = mutated[y-1][x]
          mutated[y][x] = top + cell
        default:
          let left = mutated[y][x-1]
          let top = mutated[y-1][x]
          mutated[y][x] = min(left, top) + cell
        }
      }
    }
    
    let lastRow = mutated[mutated.count - 1]
    return lastRow[lastRow.count - 1]
  }
}

Solution().minPathSum(input) // expected 7

//: [Next](@next)
