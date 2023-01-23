//import UIKit
//
//func maxArea(_ height: [Int]) -> Int {
//    var areas: [[Int]] = [[]]
//    if height.count < 2 {
//        return 0
//    } else if height.count == 2 {
//        return height[0] * height[1]
//    }
//
//    for x in 0..<height.count {
//        var areaArray: [Int] = []
//        var firstHeight = height[x]
//        if x == height.count-1 { break }
//        for y in (x+1)...height.count {
//            print("y - x is \(y-x)")
//            print("y is \(y)")
//            print("x is \()")
//            var secondHeight = height[y]
//            print("First height is: \(firstHeight)")
//            print("Second height is: \(secondHeight)")
//            print("Difference in location is: \(y-x)")
//            if firstHeight < secondHeight {
//                areaArray.append(firstHeight * (y-x))
//            } else {
//                areaArray.append(secondHeight * (y-x))
//            }
//        }
//        areas.append(areaArray)
//    }
//    print(areas)
//    var map = areas.flatMap { areaArray in
//        return areaArray
//    }
//    guard let max = map.max() else { return 0 }
//
//    return max
//}
//
//
//maxArea([1,8,6,2,5,4,3,7])


func divide(_ dividend: Int, _ divisor: Int) -> Int {
    var sum = 0
    var result = 0
    var isNegative = false
    if dividend == 0 {
        return 0
    }

    if (dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0){
        isNegative = true
    }
    let absDividend = abs(dividend)
    let absDivisor = abs(divisor)

    while sum < absDividend {
        sum += absDivisor
        result += 1
    }

    if isNegative {
        return -1 * result
    } else {
        return result
    }
}


divide(10, -5)
