import UIKit

var str = "Hello, playground"

func binarySearch(elemnts:[Int], target:Int, first: Int, last: Int)-> Int {
    let mid = (first + last) / 2
    var f = first
    var l = last
    
    if (f > l) {
        return -1
    }
    
    if elemnts[mid] == target {
        return mid
    } else if elemnts[mid] > target {
        l = mid - 1
    } else {
        f = mid + 1
    }
    
    return binarySearch(elemnts: elemnts, target: target, first: f, last: l)
}

print("The position of index is \(binarySearch(elemnts: [1, 2, 3, 4, 5], target: 5, first: 0, last: 4))")


