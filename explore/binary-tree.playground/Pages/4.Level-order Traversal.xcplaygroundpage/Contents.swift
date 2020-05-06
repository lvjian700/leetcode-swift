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
    
    var queue = [root]
    var ret:[[Int]] = []
    
    while !queue.isEmpty {
      var answer: [Int] = []

      for _ in (0...queue.count - 1) {
          let node = queue.removeFirst()
          answer.append(node.val)
          if let left = node.left {
            queue.append(left)
          }
          if let right = node.right {
            queue.append(right)
          }
      }
      
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
