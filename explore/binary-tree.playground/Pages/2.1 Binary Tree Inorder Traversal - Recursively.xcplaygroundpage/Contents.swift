//: [Previous](@previous)

import Foundation

class Solution {
  func inorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
      return []
    }
    var ret: [Int] = []
    
    func traversal(_ node: TreeNode?) {
      guard let node = node else {
        return
      }
      traversal(node.left)
      ret.append(node.val)
      traversal(node.right)
    }
    
    traversal(root)
    
    return ret
  }
}

let root = TreeNode(1, left: nil,
                      right: TreeNode(2, left: TreeNode(3, left: nil, right: nil), right: nil
  )
)

Solution().inorderTraversal(root)

//: [Next](@next)
