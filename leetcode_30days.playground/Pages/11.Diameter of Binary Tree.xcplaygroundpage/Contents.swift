//: [Previous](@previous)

import Foundation

/*:
 ## Diameter of Binary Tree
 <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3293/>
 
 ```
     1
    / \
   2   3
  / \
 4   5
 ```
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

let root = TreeNode(1,
   left: TreeNode(2,
              left: TreeNode(4),
             right: TreeNode(5)),
  right: TreeNode(3)
)
print(root)

class Solution {
  private var longestPath = 0

  func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    func depth(_ root: TreeNode?) -> Int {
      guard let root = root else {
        return 0
      }
      
      let leftMaxDepth = depth(root.left)
      let rightMaxDepth = depth(root.right)
      
      longestPath = max(longestPath, leftMaxDepth + rightMaxDepth)
      
      return 1 + max(leftMaxDepth, rightMaxDepth)
    }
    
    depth(root)
    
    return longestPath
  }
}

Solution().diameterOfBinaryTree(root)
//
let rootOnly = TreeNode(1, left: nil, right: nil)
Solution().diameterOfBinaryTree(rootOnly)
//
let twoNodes = TreeNode(1, left: TreeNode(2, left: nil, right: nil), right: nil)
Solution().diameterOfBinaryTree(twoNodes)
//: [Next](@next)
