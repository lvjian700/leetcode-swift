//: [Previous](@previous)

import Foundation

/*:
 ## Happy number
 
 ## Result
  Runtime: 8 ms
  Memory Usage: 20.6 MB
 */

//let num = 19

func findNumber(_ num: Int, attempts: Int = 0) -> Bool {
  if attempts > 30 {
    return false
  }
  
  if num == 1 { return true }

  var temp = num
  var ret = 0
  
  while temp != 0  {
    let digital = temp % 10
    temp /= 10
    ret += digital * digital
  }
  
  if ret == 1 {
    return true
  }

  return findNumber(ret, attempts: attempts + 1)
}

findNumber(19)

//: [Next](@next)
