//: [Previous](@previous)

import Foundation

/*:
 ## Mini Stack
 <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3292/>
 
 ```
 Input
 ["MinStack","push","push","push","getMin","pop","top","getMin"]
 [[],[-2],[0],[-3],[],[],[],[]]

 Output
 [null,null,null,null,-3,null,0,-2]

 Explanation
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin(); // return -3
 minStack.pop();
 minStack.top();    // return 0
 minStack.getMin(); // return -2
 ```
 */


class MinStack {
  private var minValues = [Int.max]

  private var min: Int {
    return minValues.last!
  }

  private var values: [Int]

    /** initialize your data structure here. */
    init() {
        values = []
    }
    
    func push(_ x: Int) {
      if x <= min {
        minValues.append(x)
      }

      values.append(x)
    }
    
    func pop() {
      if values.isEmpty {
        return
      }
      
      if values.removeLast() == min {
        minValues.removeLast()
      }
    }
    
    func top() -> Int {
      return values.last ?? Int.min
    }
    
    func getMin() -> Int {
      guard minValues.count > 1 else {
        return 0
      }

      return min
    }
}

let obj = MinStack()
obj.push(-2)
obj.pop()
let ret_3: Int = obj.top()
let ret_4: Int = obj.getMin()

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

//: [Next](@next)

