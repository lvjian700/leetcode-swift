//: [Previous](@previous)

import Foundation

/*:
 ## Binary Tree Postorder Traversal
 https://leetcode.com/explore/learn/card/data-structure-tree/134/traverse-a-tree/930/
 */
/*
 f -> b -> c -> d -> C -> e
 */
class Solution {
  func postorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
      return []
    }
    
    var stack: [TreeNode] = []
    var ret: [Int] = []
    var prev: TreeNode? = root

    while !stack.isEmpty || prev != nil {
      if let p = prev {
        stack.append(p)
        ret.insert(p.val, at: 0)
        prev = p.right
      } else {
        prev = stack.removeLast().left
      }
    }
    
    return ret
  }
}

let root = TreeNode(1, left: nil,
                      right: TreeNode(2, left: TreeNode(3, left: nil, right: nil), right: nil
  )
)

Solution().postorderTraversal(root) //[3,2,1]

//: [Next](@next)
