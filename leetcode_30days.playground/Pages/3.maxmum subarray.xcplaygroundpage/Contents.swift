//: [Previous](@previous)

import Foundation

let nums = [-2,1,-3,4,-1,2,1,-5,4]

func findMax(_ nums: [Int]) -> Int {
    if nums.count == 1 { return nums[0] }

    var ret = nums[0]
    var currentSum = nums[0]

    for i in 1..<nums.count {
      currentSum = max(currentSum + nums[i], nums[i])
      ret = max(ret, currentSum)
    }

    return ret
}

findMax(nums)


//: [Next](@next)
