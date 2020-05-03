import Foundation

/*:
## Binary Tree Preorder Traversal
<https://leetcode.com/explore/learn/card/data-structure-tree/134/traverse-a-tree/928/>

*/

public class TreeNode : CustomStringConvertible {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?

  public init(_ val: Int, left: TreeNode? = nil, right: TreeNode? = nil) {
    self.val = val
    self.left = left
    self.right = right
  }
  
  public var description: String {
    return "\(val) -> left: \(String(describing: left)), right: \(String(describing: right))"
  }
}

class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
      guard let root = root else {
        return []
      }

      var ret: [Int] = []
      var stack: [TreeNode] = [root]

      while !stack.isEmpty {
        let node = stack.removeLast()
        ret.append(node.val)
        
        if let right = node.right {
          stack.append(right)
        }
        
        if let left = node.left {
          stack.append(left)
        }
      }

      return ret
    }
}

let root = TreeNode(1, left: nil,
                      right: TreeNode(2, left: TreeNode(3, left: nil, right: nil), right: nil
  )
)
Solution().preorderTraversal(root)
