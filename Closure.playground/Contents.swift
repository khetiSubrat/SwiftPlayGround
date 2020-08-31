import UIKit

var str = "Hello, playground"

let closure = { (a: Int, b: Int)->Int in  return a + b }
let c = closure(5, 7)
print("The value is \(c)")



func myFunction(someClosure:()->()) {
    print("The closure is caled done")
}



myFunction(someClosure: {
    print("The closure is called")
})

func theAddition(a: Int, b: Int, c: (Int, Int) -> Int) {
    let sum = a + b + c(6, 7)
    print("The sum is \(sum)")
}

theAddition(a: 7, b: 8) { (p: Int, q: Int) -> Int in
    return p + q
}

class Sample {
    var name: String
    var rollNumber: Int
    var closure: ()->()
    init(name: String, rollNumber: Int, closure: @escaping ()->()) {
        self.name = name
        self.rollNumber = rollNumber
        self.closure = closure
    }
}

var obj = Sample(name: "Subrat", rollNumber: 1, closure: {
    print("Testing closure")
})
obj.closure()


// High order function used in Collection type  https://medium.com/@mimicatcodes/simple-higher-order-functions-in-swift-3-0-map-filter-reduce-and-flatmap-984fa00b2532

//Map -> Loop over the collection and apply the same operation to each element

var array = [1, 2, 3, 4, 5]
var newArray = array.map({(value:Int) -> Int in return value * 2})

// Filter -> Loop over collection and return which meet the condition

var myArray = [1, 2, 0, 0, 5, 6]
var filterArray = myArray.filter({(value:Int)->Bool in
    if value != 0 {
        return true
    }
    return false
})
print(filterArray)

// Reduce -> Combine all items in collection to create sigle value

myArray.reduce(0, {$0 + $1})

// FlatMap -> Flattern a collection type

// Add the squres of all even number of an array of array
let problem = [[11, 12, 13], [14, 15, 16]]
let result = problem.flatMap{$0}.filter({$0 % 2 == 0}).map({$0 * $0})
print(result)

var my = {()->() in print("This is a empty closure")}
my()

func passClosure(closure:()->()) {
    closure()
}
passClosure(closure:{()->() in print("This is function empty closure")})

func addTwoNumbeWithCompletion(onCompletion:(_ d: Int)->(), a: Int, b: Int) {
    let c = a + b
    print("The result is \(c)")
    onCompletion(c)
}

addTwoNumbeWithCompletion(onCompletion:{(d: Int)->() in print("The result is printed \(d)")}, a:5, b: 6)


var a = 10
var b = 20

var myClosureC = {[a](c:Int)->() in
    print("The value is \(a+c)")
}

a = 50

myClosureC(60)

//https://www.hackingwithswift.com/articles/179/capture-lists-in-swift-whats-the-difference-between-weak-strong-and-unowned-references
class Singer {
    func playSong() {
        print("Shake it off!")
    }
}

let taylor = Singer()

func sing() -> () -> Void {
    let taylor = Singer()
    
    let singing = {
        taylor.playSong()
        return
    }
    
    return singing
}

var newClosure = sing()
newClosure()


// High Order Functions

var originalArray = [1, 2, 3, 4, 5]
var newArraymap = originalArray.map{(a: Int)->(Int) in
    return a * 10
}
print(newArraymap)


let houseName:[String] = ["starks", "lanniesters", "targaryens", "baratheon", "arryn"]
let countArray = houseName.map{(a:String)->(Int) in
    return a.count
}
let oneMorecountArray = houseName.map{$0.count}
print(oneMorecountArray)

var filterArrayNew = originalArray.filter{(a: Int)->(Bool) in
    if a % 2 == 0 {
        return true
    }
    return false
}
print(filterArrayNew)


class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var counter: Int = 0
        nums = nums.filter{(value:Int)->(Bool) in
            if (value != 0) {
                return true
            } else {
                counter = counter + 1
                return false
            }
            
        }
        for i in 0..<counter {
            nums.append(0)
        }
        print("The nums are \(nums)")
    }
}
var sol = Solution()
var nums = [0,1,0,3,12]
sol.moveZeroes(&nums)




// Custome Binding

struct myVaribale<T> {
    var myString: T {
        didSet {
            self.closure(self.myString)
        }
    }
    var closure: (T)->()?
    
}


class myController {
    var keepChaning: String?
}


var myCon = myController()
var myvar = myVaribale(myString:"Subrat", closure:{(value:String)->() in
    myCon.keepChaning = value
    print("The current string value is \(myCon.keepChaning)")
})
myCon.keepChaning = myvar.myString;

print("The current string value is \(myCon.keepChaning)")
myvar.myString = "Kanchan"
print("The current string value is \(myCon.keepChaning)")

    func singleNumber(_ nums: [Int]) -> Int {
        
        var dict = [Int:Int]()
        let size = nums.count
        for i in 0..<size {
            if dict[nums[i]] != nil {
                var value = dict[nums[i]]
                dict[nums[i]] = value! + 1
            } else {
                dict[nums[i]] = 1
            }
        }
        var newvalue = 1
        for (key, value) in dict{
            print("\(key) : \(value)")
            if (value == 1) {
                newvalue = key
            }
        }
    return newvalue

}

let cas = singleNumber([4,1,2,1,2])
print(cas)


/*class Cricket {
    func playCricket() {
        print("Playing cricket")
    }
}
// Crash
func play()->()->Void {
    let c =  Cricket()
    let clos = {[unowned c]  in
        c.playCricket()
        return
    }
    
    return clos
}

let val = play()
val()*/


// No Crash
/*func play1()->()->Void {
    let c =  Cricket()
    let clos = {[weak c]  in
        c?.playCricket()
        return
    }
    
    return clos
}

let val1 = play()
val1()*/

// Print
//func play2()->()->Void {
//    let c =  Cricket()
//    let clos = { in
//        c.playCricket()
//        return
//    }
//
//    return clos
//}

//let val2 = play()
//val2()

//


struct DynamicType<T> {
    var closure:((T)->())?
    var v: T {
        didSet {
            if let c =  closure {
                c(v)
            }
            
        }
    }
    init(_ v: T) {
        self.v = v
    }
}


class Model {
    var name: DynamicType<String>
    var age: DynamicType<Int>
    
    init(name: String, age: Int) {
        self.name =  DynamicType(name)
        self.age = DynamicType(age)
    }
}

class Reactor {
    var rName: String
    var age: Int
    var model: Model
    
    init(model:Model) {
        self.model = model
        self.rName = self.model.name.v
        self.age = self.model.age.v
        
        self.model.name.closure = {(va: String)->() in
            self.rName = va
        }
        self.model.age.closure = {(va: Int)->() in
             self.age = va
        }
    }
    
}

var model = Model(name:"Subrat", age:31)
var reactor = Reactor(model: model)

print("The model value is \(model.name.v) and view value is \(reactor.model.name.v)")

model.name.v = "Rinky"
model.age.v = 28

print("The model value is \(model.name.v) and view value is \(reactor.model.name.v)")



var testClosure = {(a:Int, b:Int)->(Int) in
   return a + b
}

func myTestFunction(closure:@escaping(Int, Int)->(Int), name:String) {
    let v = closure(5, 6)
    print("The name is \(v) and \(name)")
}

myTestFunction(closure:{(a, b)->(Int) in
    return a + b
}, name:"Subrat")


class TestClass {
    var closure: (()->())?
    var name:String
    init(name:String) {
        self.name = name
    }
}

let t = TestClass(name: "Subrat")
t.closure = {()->() in
    print("The name is \(t.name)")
}

if let c = t.closure {
    c()
}
