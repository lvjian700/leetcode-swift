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
    let array = toArray(head)
    
    let middleIndex = (Float(array.count) / Float(2.0))
      .rounded(.down)
    return array[Int(middleIndex)]
  }
  
  private func toArray(_ head: ListNode) -> [ListNode] {
    var current = head

    var ret: [ListNode] = []

    while true {
      ret.append(current)

      if let next = current.next {
        current = next
      } else {
        return ret
      }
    }
    
    return ret
  }
}

Solution().middleNode(head1)
Solution().middleNode(head2)



// build a linked list first

//: [Next](@next)
