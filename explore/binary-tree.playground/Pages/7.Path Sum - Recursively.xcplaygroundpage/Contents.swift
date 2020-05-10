//: [Previous](@previous)

import Foundation

/*:
 ## Path Sum
 <https://leetcode.com/explore/learn/card/data-structure-tree/17/solve-problems-recursively/537/>
 
 Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.

 > A leaf is a node with no children.
 
 ### Sample
 
 Given the below binary tree and `sum = 22`,
 
 ```
       5
      / \
     4   8
    /   / \
   11  13  4
  /  \      \
 7    2      1
 ```
 
 return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.
 */

class Solution {
  func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
    guard let root = root else { return false }

    if root.left == nil && root.right == nil && root.val == sum {
      return true
    }
    
    return hasPathSum(root.left, sum - root.val)
      || hasPathSum(root.right, sum - root.val)
  }
}

let input = TreeNode(5,
                left: TreeNode(4,
                         left: TreeNode(11,
                                   left: TreeNode(7),
                                  right: TreeNode(2)
                               ),
                        right: nil
                      ),
               right: TreeNode(8,
                         left: TreeNode(13),
                        right: TreeNode(4,
                                   left: nil,
                                  right: TreeNode(1)
                               )
                      )
)

Solution().hasPathSum(input, 22) // true

let input2 = TreeNode(1, left: TreeNode(2), right: nil)
Solution().hasPathSum(input2, 1) // false
//: [Next](@next)
