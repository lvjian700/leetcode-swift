//: [Previous](@previous)

import Foundation

/*:
 ## Construct Binary Search Tree from Preorder Traversal
 <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3305/>

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

// build the node


class Solution {
  func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
    guard let first = preorder.first else {
      return nil
    }

    let head = TreeNode(first)

    for i in stride(from: 1, to: preorder.count, by: 1) {
      let leaf = TreeNode(preorder[i])
      var node: TreeNode? = head

      while true {
        guard let current = node else {
          break
        }
        
        if (leaf.val < current.val) {
          if current.left == nil {
            current.left = leaf
            break
          } else {
            node = current.left
          }
        } else {
          if current.right == nil {
            current.right = leaf
            break
          } else {
            node = current.right
          }
        }
      }
    }
    
    return head
  }
}

let ret = Solution().bstFromPreorder([8,5,1,7,10,12])
print(ret)

//: [Next](@next)
