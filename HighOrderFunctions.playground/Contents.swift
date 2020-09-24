import UIKit

var str = "Hello, playground"



let scores = ["1", "2", "three", "four", "5"]

let mapped = scores.map({(a: String)->(Int?) in
    return Int(a)
})
print(mapped)

let mapped1 = scores.compactMap({(a: String) -> (Int?) in
    return Int(a)
})

print(mapped1)

let scoresByName = ["Henk": [0, 5, 8], "John": [2, 5, 8]]

let mapped2 = scoresByName.map { $0.value }
print(mapped2)

let mapped3 = scoresByName.map({(a: (key: String, value: [Int])) -> ([Int]) in
    return a.value
})
print(mapped3)

let mapped4 = scoresByName.flatMap({(a: (key: String, value: [Int])) -> ([Int]) in
    return a.value
})
print(mapped4)


let value = [0, 1, 2, 3, 4]
let result = value.reduce(0, {(x: Int, y: Int)->(Int) in
    return x + y
})
print(result)


let giraffes = [[5, 6, 9], [11, 2, 13, 20], [1, 13, 7, 8, 2]]

let result1 = giraffes.flatMap({(a: [Int]) -> ([Int]) in
    return a
}).filter({(a: Int)->(Bool) in
    if a > 10 {
        return true
    }
    return false
})

print(result1)

let result2 = giraffes.flatMap({$0}).filter({$0 > 10})
print(result2)


//
struct User {
    let name: String
    let age: Int
}


