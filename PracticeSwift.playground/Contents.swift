import UIKit

var str = "Hello, playground"


var strings = ["a", "b", "c"]
print(strings)

var strings1 = ["d", "e", "f"]
print(strings1)

struct student {
    var name: String
    var rollnumber: Int
    init(name: String, rollnumber: Int) {
        self.name = name
        self.rollnumber = rollnumber
    }
    
    mutating func changeRollNumber(forStudent:Int, newNumber: Int) {
        self.rollnumber = newNumber
    }
}

var studentObj = student(name: "subrat", rollnumber: 5)
studentObj.changeRollNumber(forStudent: 5, newNumber: 6)


let array = [5, 54, 54, 63, 63, 7, 8, 9, 9]
var hashArray = Array(repeating: 0, count: 1000)

for val in array {
    let n = hashArray[val]
    hashArray[val] = n + 1
}

var newArray = [Int]()
for val in array {
    let n = hashArray[val]
    if n == 1 {
        newArray.append(val)
    }
}
//dump(newArray)

/* Input String: Agoda is a best app
 Output String: App best a is Agoda*/

let inputString = "Agoda is a best app"
let spaceArray = inputString.split(separator: " ")
var reverseArray: String = ""
let count = spaceArray.count - 1

for  i  in stride(from: count, to: 0, by: -1) {
    reverseArray = reverseArray + spaceArray[i]
    reverseArray = reverseArray + " "
    print(i)
}

dump(reverseArray)

// NSOperation

let task1 = BlockOperation.init {
    for i in  0...3 {
        print(i)
    }
}

let task2 = BlockOperation.init {
    for i in  4...8 {
        print(i)
    }
}
task2.addDependency(task1)
let q = OperationQueue()
q.addOperations([task1, task2], waitUntilFinished: true)


// POP

protocol Vechicle {
    var isRunning: Bool {get set}
    mutating func start()
    mutating func turnoff()
}

struct SportsCar: Vechicle {
    var isRunning: Bool = false
    
    mutating func start() {
        if isRunning {
            print("Alreday started")
        } else {
            isRunning = true
            print("vroom")
        }
    }
    
    mutating func turnoff() {
        if isRunning {
            isRunning = false
            print("cricketing")
        } else {
            print("Already dead")
        }
    }
}

class SemiTruck: Vechicle {
    var isRunning: Bool = false
    
    func start() {
        if isRunning {
            print("Already started")
        } else {
            isRunning = true
            print("Rumbbling")
        }
    }
    
    func turnoff() {
        if isRunning {
            isRunning = false
            print("put.. put.. silence")
        } else {
            print("Already shutdown")
        }
    }
    func blowAndHorn() {
        print("Tooth")
    }
    
}

var car1 = SportsCar()
var truck = SemiTruck()
car1.start()
truck.start()
truck.blowAndHorn()
// Protocol as type
var vechicleArray: Array<Vechicle> = [car1, truck]

for vech in vechicleArray {
    if let v = vech as? SemiTruck {
        print("\(v.blowAndHorn())")
    }
}

    // Struct value type and Class as refernce type
// DBS

/*var foo = bar=0 bar*=5
 print(foo)*/


/*func greet(var name:String) {
 name = name.uppercased()
 print("Greeting, \(name)!")
 greet(name: "River")
 }
 
 final class Dog {
 func bark(){
 print("woof")
 }
 }
 class Corgi:Dog {
 override func bark() {
 print("yip")}
 
 }
 }*/

/*let i=11
 let j=20
 let name = 9...11 ~= i ? j % 2 == 1 ? "a" : "b" : "c"
 print(name)*/

/*func divide (a: Int, b: Int)  -> Int {
 var c = -1
 c = a / b
 return c
 }
 
 var v = divide(a: 4, b: 0)
 do {
 try divide(a: 4, b: 0)
 } catch <#pattern#> {
 <#statements#>
 }*/

// Agoda
/*struct foo {
 var x  = 2
 }
 var f = foo()
 var f2 = f
 f2.x = 1
 print(f.x);*/

/*var a: String = "A"
 var b: String! = "B"
 var c: String? = "C"
 //a = nil
 b = nil
 c = nil
 b = a
 a = b
 //a = c
 c = b
 b = c*/

//let names = ["F": "A", "V":"C"]
//let food = name["M"] ?? "N"
//print(food)

// Find no duplicates

/*Input array = [5, 54, 54, 63, 63, 7, 8, 9, 9]
 output array = [5, 7, 8]*/

var array1 = [3, 5, 6, 7, 8, 9]

var f = 0
var l = array1.count - 1

for i in 0...((array1.count - 1) / 2) {
    var t = array1[i]
    array1[i] = array1[l]
    array1[l] = t
    l = l - 1
}
print("The reverse array is \(array1)")


// Observable Pattern

protocol Observer {
    var value: Int {get}
    func update(withNewvalue: Int)
}

protocol Observable {
    
    var observerArray:[Observer] {get set}
    
    func addObserver(obs: Observer)
    func removeObserver(obs: Observer)
}

class MyObserver:Observer {
    private var _value: Int = 0
    var value: Int {
        get {
            return self._value
        }
    }
    init(id: Int) {
        self._value = id
    }
    func update(withNewvalue: Int) {
        
    }
    
    
}


