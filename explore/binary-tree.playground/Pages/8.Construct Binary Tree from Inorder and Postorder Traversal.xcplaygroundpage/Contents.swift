//: [Previous](@previous)

import Foundation

/*:
 ## Construct Binary Tree from Inorder and Postorder Traversal
 <https://leetcode.com/explore/learn/card/data-structure-tree/133/conclusion/942/>
 
 ```
 // input
 inorder =   [9,3, 15,20,7] // left, root, left,  root, right
 postorder = [9,15,7, 20,3] // left, left, right, root, root
 20 -> r 7
 // output
   3
  / \
 9  20
   /  \
  15   7
 
 */

class Solution {
  func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    return build(inorder, 0, inorder.count - 1, postorder, 0, postorder.count - 1)
  }
  
  private func build(_ inorder: [Int], _ iLeft: Int, _ iRight: Int,
                _ postorder: [Int], _ pLeft: Int, _ pRight: Int) -> TreeNode? {
    if (iLeft > iRight || pLeft > pRight) { return nil }
    
    // read root in postorder
    let curr = TreeNode(postorder[pRight])
    
    // find root in inorder
    var index = 0
    for i in stride(from: iLeft, through: iRight, by: 1) {
      if (inorder[i] == curr.val) {
        index = i
        break
      }
    }

    curr.left = build(inorder, iLeft, index - 1, postorder, pLeft, pLeft + index - iLeft - 1)
    curr.right = build(inorder, index + 1, iRight, postorder, pLeft + index - iLeft, pRight - 1)
    
    return curr
  }
}

let inorder: [Int]   = [9, 3,  15, 20, 7]
let postorder: [Int] = [9, 15, 7,  20, 3]

Solution().buildTree(inorder, postorder)

//: [Next](@next)
