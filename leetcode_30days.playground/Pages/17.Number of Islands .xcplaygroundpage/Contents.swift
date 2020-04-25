//: [Previous](@previous)

import Foundation

/*:
 ## Number of Islands
 <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3302/>
 
 ```
 Input:
 11110
 11010
 11000
 00000

 Output: 1
 ```
 
 ```
 Input:
 11000
 11000
 00100
 00011

 Output: 3
 ```
 
 */

class Solution {
  private var ret = 0
  private var rows = 0
  private var cols = 0

  func numIslands(_ grid: [[Character]]) -> Int {
    guard let first = grid.first, !first.isEmpty else {
      return 0
    }

    rows = grid.count
    
    cols = first.count
    print("+y ", rows, "+x ", cols)

    var visited = Array(repeating: Array(repeating: false,
                                     count: cols),
                    count: rows)
    
    
    for y in stride(from: 0, to: rows, by: 1) {
      for x in stride(from: 0, to: cols, by: 1) {
        if grid[y][x] == "0" || visited[y][x] {
          continue
        }

        dfs(grid, &visited, x, y)
        ret += 1
      }
    }
    
    return ret
  }
  
  private func dfs(_ grid: [[Character]], _ visited: inout [[Bool]], _ x: Int, _ y: Int) {
    guard (0..<cols).contains(x), (0..<rows).contains(y),
      grid[y][x] != "0", !visited[y][x]
    else {
      return
    }

    visited[y][x] = true
    dfs(grid, &visited, x - 1, y)
    dfs(grid, &visited, x + 1, y)
    dfs(grid, &visited, x, y - 1)
    dfs(grid, &visited, x, y + 1)
  }
}


Solution().numIslands([
  ["1", "1", "1", "1", "0"],
  ["1", "1", "0", "1", "0"],
  ["1", "1", "0", "0", "0"],
  ["0", "0", "0", "0", "0"]
])

Solution().numIslands([
  ["1", "1", "0", "0", "0"],
  ["1", "1", "0", "0", "0"],
  ["0", "0", "1", "0", "0"],
  ["0", "0", "0", "1", "1"]
])

//: [Next](@next)
