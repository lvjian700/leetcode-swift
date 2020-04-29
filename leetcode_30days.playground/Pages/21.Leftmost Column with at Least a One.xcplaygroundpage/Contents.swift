//: [Previous](@previous)

import Foundation

/*:
 ## Leftmost Column with at Least a One
 <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3306/>
 
 */

/**
 * // This is the BinaryMatrix's API interface.
 * // You should not implement it, or speculate about its implementation
 * public class BinaryMatrix {
 *     public func get(_ row: Int, _ col: Int) -> Int {}
 *     public func dimensions() -> [Int] {}
 * };
 */

public struct BinaryMatrix {
  let matrix: [[Int]]

  public func get(_ row: Int, _ col: Int) -> Int {
    return matrix[row][col]
  }
  public func dimensions() -> [Int] {
    return [matrix.count, matrix[0].count]
  }
}

let mat = BinaryMatrix(matrix: [[0,0],[1,1]])
mat.dimensions()
mat.get(0, 0 )
mat.get(1, 1 )

class Solution {
    func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
      let rows = binaryMatrix.dimensions()[0]
      let cols = binaryMatrix.dimensions()[1]
      
      var row = 0
      var col = cols - 1
      var found = false
      
      while row < rows && col >= 0 {
        let cell = binaryMatrix.get(row, col)
        if cell == 1 {
          found = true
          if row + 1 == rows && col > 0 && binaryMatrix.get(row, col - 1) == 0 {
            return col
          }

          col -= 1
        } else {
          row += 1
        }
      }
      
      return row == rows && !found ? -1 : col + 1
    }
}

let largeMat = BinaryMatrix(matrix: [[0,0,0,1],[0,0,1,1],[0,1,1,1]])
Solution().leftMostColumnWithOne(largeMat)

Solution().leftMostColumnWithOne(
  BinaryMatrix(matrix: [[0,0],[1,1]])
)


Solution().leftMostColumnWithOne(
  BinaryMatrix(matrix: [[0,0],[0,0]])
)

Solution().leftMostColumnWithOne(
  BinaryMatrix(matrix: [[0,0,0,0,1,1],[0,0,0,1,1,1],[0,0,0,0,1,1],[0,0,0,0,1,1],[0,0,0,1,1,1],[0,0,0,1,1,1]])
)


//: [Next](@next)
