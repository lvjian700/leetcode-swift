//: [Previous](@previous)

import Foundation

/*:
 ## Binary Tree Level Order Traversal
 <https://leetcode.com/explore/learn/card/data-structure-tree/134/traverse-a-tree/931/>
 
 ### Input
 
 ```
   3
  / \
 9  20
   /  \
  15   7
 ```
 
 ### Output
 
 ```
 [
   [3],
   [9,20],
   [15,7]
 ]
 ```
 */
class Solution {
  func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else {
      return []
    }
    
    var level = [root]
    var ret:[[Int]] = []
    
    while !level.isEmpty {
      var answer: [Int] = []
      var nextLevel: [TreeNode] = []

      for node in level {
          answer.append(node.val)

          if let left = node.left {
            nextLevel.append(left)
          }

          if let right = node.right {
            nextLevel.append(right)
          }
      }
      
      level = nextLevel
      ret.append(answer)
    }
    
    return ret
  }
}

let head = TreeNode(3,
    left: TreeNode(9, left: nil, right: nil),
   right: TreeNode(20,
            left: TreeNode(15, left: nil, right: nil),
           right: TreeNode(7, left: nil, right: nil)
  )
)

Solution().levelOrder(head)
//: [Next](@next)
