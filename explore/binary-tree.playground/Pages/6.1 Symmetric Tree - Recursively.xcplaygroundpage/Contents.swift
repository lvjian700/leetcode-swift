//: [Previous](@previous)

import Foundation

/*:
 ## Symmetric Tree
 <https://leetcode.com/explore/learn/card/data-structure-tree/17/solve-problems-recursively/536/>
 
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

 For example, this binary tree `[1,2,2,3,4,4,3]` is symmetric:
 
 ```
     1
    / \
   2   2
  / \ / \
 3  4 4  3
 ```
 
 But the following [1,2,2,null,3,null,3] is not:
 
 ```
   1
  / \
 2   2
  \   \
  3    3
 ```
 
 **Follow up**: Solve it both recursively and iteratively.
 */

class Solution {
  func isSymmetric(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }

    func checkSymmetric(_ result: Bool, left: TreeNode?, right: TreeNode?) -> Bool {
      if result == false || (left == nil && right == nil) {
        return result
      }
      
      let leftResult = checkSymmetric(left?.val == right?.val,
                               left: left?.left,
                              right: right?.right)

      return checkSymmetric(leftResult && left?.val == right?.val,
                        left: left?.right,
                       right: right?.left)
    }
    
    return checkSymmetric(root.left?.val == root.right?.val,
                         left: root.left,
                        right: root.right)
  }
}

let input = TreeNode(1,
              left: TreeNode(2,
                      left: TreeNode(3),
                     right: TreeNode(4)
              ),
              right: TreeNode(2,
                      left: TreeNode(4),
                     right: TreeNode(3)
              )
            )

Solution().isSymmetric(input) // true

let input2 = TreeNode(1,
  left: TreeNode(2,
          left: nil,
         right: TreeNode(3)
  ),
  right: TreeNode(2,
          left: nil,
         right: TreeNode(3)
  )
)

Solution().isSymmetric(input2) // false

let input3 = TreeNode(1,
  left: TreeNode(2,
          left: TreeNode(3),
         right: nil
  ),
  right: TreeNode(2,
          left: nil,
         right: TreeNode(3)
  )
)

Solution().isSymmetric(input3) // true

let input4 = TreeNode(1,
  left: TreeNode(2,
          left: TreeNode(3),
         right: TreeNode(5)
  ),
  right: TreeNode(2,
          left: nil,
         right: TreeNode(3)
  )
)

Solution().isSymmetric(input4) // false

//: [Next](@next)
