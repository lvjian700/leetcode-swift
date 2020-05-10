//: [Previous](@previous)

import Foundation

class Solution {
  func postorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
      return []
    }
    
    var ret: [Int] = []
    
    func postorder(_ node: TreeNode) {
      if let left = node.left {
        postorder(left)
      }
      
      if let right = node.right {
        postorder(right)
      }
      
      ret.append(node.val)
    }
    
    postorder(root)
    
    return ret
  }
}

let root = TreeNode(1, left: nil,
                      right: TreeNode(2, left: TreeNode(3, left: nil, right: nil), right: nil
  )
)

Solution().postorderTraversal(root) //[3,2,1]

//: [Next](@next)
