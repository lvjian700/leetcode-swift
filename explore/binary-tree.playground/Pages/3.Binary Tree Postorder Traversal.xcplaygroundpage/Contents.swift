//: [Previous](@previous)

import Foundation

/*:
 ## Binary Tree Postorder Traversal
 https://leetcode.com/explore/learn/card/data-structure-tree/134/traverse-a-tree/930/
 */

class Solution {
  func postorderTraversal(_ root: TreeNode?) -> [Int] {
    return []
  }
}

let root = TreeNode(1, left: nil,
                      right: TreeNode(2, left: TreeNode(3, left: nil, right: nil), right: nil
  )
)
Solution().postorderTraversal(root) //[3,2,1]

//: [Next](@next)
