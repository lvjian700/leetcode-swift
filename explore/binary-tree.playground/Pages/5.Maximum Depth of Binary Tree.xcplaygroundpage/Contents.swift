//: [Previous](@previous)

import Foundation

/*:
 ## Maximum Depth of Binary Tree
 <https://leetcode.com/explore/learn/card/data-structure-tree/17/solve-problems-recursively/535/>
 
 Given a binary tree, find its maximum depth.

 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

 > A leaf is a node with no children.
 
 **Input**
 
 ```
   3
  / \
 9  20
   /  \
  15   7
 ```
 
 return its depth = 3
 */


class Solution {
  func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    func findDepth(_ node: TreeNode?, depth: Int) -> Int {
      guard let node = node else { return depth }
      
      let leftDepth = findDepth(node.left, depth: depth + 1)
      let rightDepth = findDepth(node.right, depth: depth + 1)
      
      return max(leftDepth, rightDepth)
    }
    
    return findDepth(root, depth: 0)
  }
}

let input = TreeNode(3,
       left: TreeNode(9),
      right: TreeNode(20,
               left: TreeNode(15),
              right: TreeNode(7)
             )
)

Solution().maxDepth(input)

//: [Next](@next)
