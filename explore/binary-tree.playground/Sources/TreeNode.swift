import Foundation

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
