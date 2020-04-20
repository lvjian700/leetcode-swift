//: [Previous](@previous)

import Foundation

public class ListNode: CustomStringConvertible {
   public var val: Int
   public var next: ListNode?
   public init(_ val: Int) {
       self.val = val
       self.next = nil
   }
  
  public var description: String {
    return "\(val) -> \(String(describing: next))"
  }
}

func buildLinkedList(_ array: [Int]) -> ListNode {
  let head = ListNode(array[0])
  var tail = head
  
  for i in 1...(array.count - 1) {
    tail.next = ListNode(array[i])
    if let next = tail.next {
        tail = next
    }
  }
  
  return head
}

let head1 = buildLinkedList([1,2,3,4,5])
print((String(describing: head1)))

let head2 = buildLinkedList([1,2,3,4,5,6])
print((String(describing: head2)))

class Solution {
  func middleNode(_ head: ListNode?) -> ListNode? {
    guard let head = head else {
      return nil
    }
    
    var fast: ListNode? = head
    var slow: ListNode? = head
    
    while fast?.next != nil {
      slow = slow?.next
      fast = fast?.next?.next
    }
    
    return slow
  }
}

Solution().middleNode(head1)
Solution().middleNode(head2)

//: [Next](@next)
