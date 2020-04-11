import Foundation

let nums = [4,1,2,1,2]
var temp = Set<Int>()

for n in nums {
  if temp.contains(n) {
    temp.remove(n)
  } else {
    temp.insert(n)
  }
}

temp.removeFirst()
