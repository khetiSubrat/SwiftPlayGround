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


var array = [1, 10, 5, 7, 0, 3 , 4]

func mergeSort(_ array: inout [Int], _ length: Int) {
    
    if length <= 1 {
        return
    }
    
    let mid = length / 2
    
    var array1 = [Int]()
    var array2 = [Int]()
    
    
    for i in 0..<mid {
        array1.append(array[i])
    }
    
    for i in mid..<length {
         array2.append(array[i])
    }
    
    
    mergeSort(&array1, mid)
    mergeSort(&array2, length - mid)
    merge(&array1, &array2, &array)
    
}

func merge(_ array1:inout [Int], _ array2: inout [Int], _ mainArray:inout [Int]) {
    
    var i = 0
    var j = 0
    var k = 0
    
    while i < array1.count && j < array2.count {
        
        if array1[i]  ==  array2[j] {
            mainArray[k] = array1[i]
            i = i + 1
            j = j + 1
            k = k + 1
            
        } else if array1[i] < array2[j] {
               mainArray[k] = array1[i]
               i = i + 1
               k = k + 1
        } else if (array1[i] > array2[j]) {
               mainArray[k] = array2[i]
               j = j + 1
               k = k + 1
        }
    }
    
    while i < array1.count {
        mainArray[k] = array1[i]
        i = i + 1
        k = k + 1
    }
    
    while j < array2.count {
        mainArray[k] = array2[j]
        j = j + 1
        k = k + 1
    }
    
}

mergeSort(&array, array.count)
print(array)
