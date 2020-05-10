//: [Previous](@previous)

import Foundation

/*:
 ## Binary Tree Inorder Traversal
 <https://leetcode.com/explore/learn/card/data-structure-tree/134/traverse-a-tree/929/>
 */
// 1, 2, 3
class Solution {
  func inorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
      return []
    }
    var ret: [Int] = []
    var stack: [TreeNode] = []
    var current: TreeNode? = root

    while current != nil || !stack.isEmpty {
      while current != nil  {
        guard let curr = current else { break; }
        stack.append(curr)
        current = curr.left
      }
      
      current = stack.removeLast()
      ret.append(current!.val)
      
      current = current?.right
    }
   
    return ret
  }
}

let root = TreeNode(1, left: nil,
                      right: TreeNode(2, left: TreeNode(3, left: nil, right: nil), right: nil
  )
)

Solution().inorderTraversal(root)

//: [Next](@next)
