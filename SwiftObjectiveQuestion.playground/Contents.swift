import UIKit

var str = "Hello, playground"

print("Question 1")

let names = ["Serenity", "Sulaco", "Enterprise", "Galactica"]

if let last = names.last {
    print(last)
}

print("Question 2")

var i = 2

repeat {
    i *= i * 2
} while i < 100

print(i)

print("Question 3")

// The willSet property observer is triggered only when the initial value is changed, and not when the struct is created using memberwise initialization.

struct Spaceship {
    var name: String {
        willSet {
            print("I'm called \(newValue)!")
        }
    }
}

var serenity = Spaceship(name: "Serenity")
serenity.name = "TARDIS"

print("Question 4")
//Subscripting an array of strings will return a String rather than a String?, which means it is a compile error to attempt to unwrap it using if let.

/*let names = ["Chris", "Joe", "Doug", "Jordan"]

if let name = names[1] {
    print("Brought to you by \(name)")
}*/

print("Question 5")

/*let i = 3

switch i {
case 1:
    print("Number was 1")
case 2:
    print("Number was 2")
case 3:
    print("Number was 3")
}
Your answer: "Number was 3".*/


//Explanation: Swift requires all switch statements to be exhaustive. This code will not compile because it does not have a default clause.
print("Question 6")
var motto = "Bow ties are cool"
motto.replacingOccurrences(of: "Bow", with: "Neck")
print(motto)

print("Question 6")
let ii = "5"
let j = ii + ii

print("Question 7")
let namesNew = ["Pilot": "Wash", "Doctor": "Simon"]
let doctor = namesNew["doctor"] ?? "Bones"
print(doctor)

print("Question 8")
//var iii = 1
//
//mainLoop: repeat {
//    iii += 2
//
//    switch iii % 2 {
//    case 0:
//        break mainLoop
//    default:
//        break
//    }
//} while true
//
//print("Complete!")

print("Question 9")
let numbers = Array(1..<10)
print(numbers.count)

print("Question 10")
let point = (556, 0)
switch point {
case (let x, 0):
    print("X was \(x)")
case (0, let y):
    print("Y was \(y)")
case let (x, y):
    print("X was \(x) and Y was \(y)")
}

print("Question 11")
//func sum(numbers: Int...) -> Int {
//    var result = 0
//    
//    for number in numbers {
//        result += number
//    }
//    
//    return result
//}
//
//let result = sum(numbers: [1, 2, 3, 4, 5])
