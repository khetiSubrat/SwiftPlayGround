//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//
//class MyObjectToObserve: NSObject {
//    @objc dynamic var myDate = NSDate(timeIntervalSince1970: 0) // 1970
//    func updateDate() {
//        myDate = myDate.addingTimeInterval(Double(2 << 30)) // Adds about 68 years.
//    }
//}
//
//class MyObserver: NSObject {
//    @objc var objectToObserve: MyObjectToObserve
//    var observation: NSKeyValueObservation?
//
//    init(object: MyObjectToObserve) {
//        objectToObserve = object
//        super.init()
//
//        observation = observe(
//            \.objectToObserve.myDate,
//            options: [.old, .new]
//        ) { object, change in
//            print("myDate changed from: \(change.oldValue!), updated to: \(change.newValue!)")
//        }
//    }
//}
//
//let observed = MyObjectToObserve()
//let observer = MyObserver(object: observed)
//
//
//observed.updateDate()
//
//let label = "The width is "
//let width = 94
//let widthLabel = label + String(width)
//
//let vegetable = "red pepper"
//switch vegetable {
//case "celery":
//    print("Add some raisins and make ants on a log.")
//case "cucumber", "watercress":
//    print("That would make a good tea sandwich.")
//case let x where x.hasSuffix("pepper"):
//    print("Is it a spicy \(x)?")
//default:
//    print("Everything tastes good in soup.")
//}
//
//func greet(person: String, day: String) {
//    print("Hello \(person) today is \(day)")
//}
//greet(person: "Subrat", day: "Monday")
//
//func greet(_ person: String, _ day: String) {
//   print("Hello \(person) today is \(day)")
//}
//greet("john", "Tuesday")
//
//func calculateStatics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
//    var sum = 0
//    var min = scores[0]
//    var max = scores[0]
//
//    for score in scores {
//        if score > max {
//            max = score
//        }
//        if score < min {
//            min = score
//        }
//        sum = sum + score
//    }
//
//    sum = min + max
//    return(min, max, sum)
//}
//
//let statistics = calculateStatics(scores: [5, 3, 100, 3, 9])
//print(statistics.2)
//print(statistics.0)
//print(statistics.1)
//
func returnFifty()-> Int {
    var y = 40
    func add() {
        y = y + 10
    }

    add()
    return y
}

let val = returnFifty()






//if let s = String.init("somestring") {
//    print(s)
//}
"t".forEach{(char) in print(char)}
var test = 1 == 1
print(test)

var items = ["A", "B", "C"]
for greet in items {
    print(greet)
    items.append("D")
}

//let x = ["1", "2"].dropFirst()
//let y = x[0]
//print(y)

//typealies Things = str
let names = ["Subrat", "Mark", "Beta", "Gamma"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1<s2
}


// ARC
class User {
    let name: String
    
    init(name: String) {
        self.name = name
        print("User \(name) was initialized")
    }
    
    deinit {
        print("Deallocating user named: \(name)")
    }
}

class CarrierSubscription {
    let name: String
    let countryCode: String
    let number: String
    let user: User
    
    init(name: String, countryCode: String, number: String, user: User) {
        self.name = name
        self.countryCode = countryCode
        self.number = number
        self.user = user
        print("CarrierSubscription \(name) is initialized")
    }
    deinit {
        print("Deallocating CarrierSubscription named: \(name)")
    }
}

var subscriptions: [CarrierSubscription] = []

print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")

class WWDCGreeting {
    let who: String
    
    init(who: String) {
        self.who = who
    }
    
    lazy var greetingMaker: () -> String = { [weak self] in
        print(self)
        return "Hello \(self?.who)."
    }
}

let greetingMaker: () -> String

do {
    let mermaid = WWDCGreeting(who: "caffeinated mermaid")
    print(mermaid)
    greetingMaker = mermaid.greetingMaker
}

print(greetingMaker()) // TRAP!
print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var productBarcode = Barcode.upc(8, 85909, 51226, 3)



// Stack

struct Stack {
    var top: Int
    var stackArray = [Int]()
    init() {
        top = -1
    }
    mutating func push(item: Int) {
        stackArray.append(item)
        top = top + 1
    }
    
    func pop()->Int {
        return  stackArray[top]
    }
    
    func printing() {
        for val in stackArray {
            print("\(val)")
        }
    }
}

var stackVar = Stack()
stackVar.push(item: 5)
stackVar.push(item: 6)
stackVar.push(item: 7)
var popItem = stackVar.pop()
print("\(popItem)")
stackVar.push(item: 5)
stackVar.push(item: 6)
stackVar.push(item: 8)
popItem = stackVar.pop()
print("\(popItem)")


print("**************************")




var stringHash = [Character: Int]()
let targetString = "geeksforgeeks"
for ch in targetString {
    if let v = stringHash[ch] {
        stringHash[ch] = v + 1
    } else {
        stringHash[ch] = 1
    }
}

for ch in targetString {
    if stringHash[ch] == 1 {
        print("The first unique character is \(ch)")
    }
}

//var testArray = [UInt8]()






var searchString = "hackerrank"
var storeDict = [Character: Int]()

var inputString = "hackerworld"
for ch in inputString  {
    if let val = storeDict[ch] {
        storeDict[ch] = val + 1
    } else {
        storeDict[ch] = 1
    }
}

for (key,val) in storeDict {
    print("key is \(key) and value is  \(val)")
}



print("**************************")

func goodMorning(isMorning: Bool, whom:String) {
    if isMorning {
        print("Good morning \(whom)")
    }
}


func giveAname() -> String {
    print("giveAname() is called")
    return "Robert"
}

goodMorning(isMorning: true, whom: giveAname())
goodMorning(isMorning: false, whom: giveAname())

let arrayOfInt = [2,3,4,5,4,7,2]
var newarray = [Int]()

for val in arrayOfInt {
    newarray.append(val * 20)
}

//newarray = newarray.map()

var array = [12, 65, 0, 43, 21, 67, 87]

for i in 0..<array.count - 1 {
    for j in (i+1)..<array.count - 1 {
        if array[i] > array[j] {
            var temp = 0
            temp = array[i]
            array[i] = array[j]
            array[j] = temp
        }
    }
 }

print("Sorted array is \(array)")

var testtuple = (0, "hello")


// URL connection


struct MyGitHub:Codable {
    let name: String?
    let location: String?
    let followers: Int?
    let avatar_url: URL?
    let public_repo: Int?
}

//let url = URL(string: "https://api.github.com/users/shashikant86")
//let request = URLRequest(url: url!)
//URLSession.shared.dataTask(with: request) { (data, response, error) in
//    if let error = error {
//        print(error)
//    } else {
//        do {
//            let decoder = JSONDecoder()
//            let gitData = try decoder.decode(MyGitHub.self, from: data!)
//            print(gitData.name)
//        }
//        catch let error {
//            print(error)
//        }
//    }
//}
// Maximum distance between two array

let recurrance = [3, 2, 1, 2, 1, 4, 5, 8, 6, 7, 4, 2]
var hashMap = [Int:Int]()
var max = 0
for index in 0..<recurrance.count {
    if let val = hashMap[recurrance[index]] {
        var distance = index - val
        if distance > max {
            max = distance
        }
    } else {
        hashMap[recurrance[index]] = index
    }
}
print("The distance is \(max)")


var newArray = [1, 2, 3, 4, 5]
var mapArray = newArray.map { (value:Int) in
    return value * 2
}

let evenArray = newArray.filter { (val:Int) -> Bool in
    return val % 2 == 0
}


var palin = "madam"
var index = 0
var spostion = 0
var eposition = palin.count - 1
print(palin.count)
while index < (palin.count / 2) {
    let s = palin.index(palin.startIndex, offsetBy: spostion)
    let e = palin.index(palin.startIndex, offsetBy: eposition)
    if (palin[s] != palin[e]) {
        print("Not a palindrom")
    } else {
        spostion = spostion + 1
        eposition = eposition - 1
    }
    index += 1
}

var firstArray = [1, 2, 3, 4, 5]
var secondArray = firstArray
secondArray[1] = 6
print("\(secondArray[1]) and \(firstArray[1])")

var completionHandeler:(String, String)->() = { (name, newname) in
    print("completionHandler \(name) and newname is \(newname)")
}
completionHandeler("subbrat", "rinky")

func canthrowError(value: Int) throws -> String {
    if value == 401 {
        return "Fail"
    }
    return ""
}

do {
    try canthrowError(value: 401)
} catch let error {
    print(error)
}




func isProperlyNested(_ myString: String) -> Bool {
    var dict:[Character: Int] = ["(":0, ")":0]
    
    for ch in myString {
        if ch == "(" {
            let c = dict["("]
            dict["("] = c! + 1
        } else if ch == ")" {
            let c = dict[")"]
            dict[")"] = c! - 1
        }
    }
    
    var c = 0
    for (_, value) in dict {
        c = c + value
    }
    
    if c == 0 {
        return true
    }
    
    return false
    
}
let result = isProperlyNested("((()))")
print(result)


var dict:[Character:Int] = ["a":0, "b":0, "c":0, "d":0, "e":0, "f":0, "g":0, "h":0, "i":0, "j":0, "k":0,"l":0, "m":0, "n":0, "o":0, "p":0, "q":0, "r":0, "s":0, "t":0, "u":0]

let duplicate = "deskera"

for ch in duplicate {
    let v = dict[ch]
    dict[ch] = v! + 1
}
for ch in duplicate {
    if dict[ch] == 2 {
        print("find duplicate character is \(ch)")
    }
}

struct stock {
    var buy: Int
    var sell: Int
    init() {
       buy = 0
       sell = 0
    }
}

let conatiner = [stock]()
let sells = [100, 180, 260, 310, 40, 535, 695]

var myArray = [2, 3, 4, 0, 0, 7, 2, 0, 0, 1]
var countZero = 0

var newArray1 = myArray.filter { (value) -> Bool in
    if value != 0 {
        return true
    }
    countZero = countZero + 1
    return false
}

for _ in 0...countZero {
    newArray1.append(0)
}
print(newArray1)

let op = BlockOperation.init {
    print("Login")
}
let op1 = BlockOperation.init {
    print("download image")
}
op1 .addDependency(op)

let q = OperationQueue()
q.addOperations([op, op1], waitUntilFinished: true)
//Operation and OperationQueue
//class myOp: Operation {
//    override init() {
//        print("init")
//    }
//    override func main() {
//        //print("main AA")
//        for index in 0...4 {
//            print(index)
//        }
//    }
//
//   /* override func start() {
//        for index in 0...4 {
//            print(index)
//        }
//    }*/
//}
//
//class myOp1: Operation {
//    override init() {
//        print("init")
//    }
//    override func main() {
//
//        for index in 5...10 {
//            print(index)
//        }
//    }
//
//   /* override func start() {
//        for index in 5...10 {
//            print(index)
//        }
//    }*/
//}
//
//let ope = myOp()
//let ope1 = myOp1()
////ope1 .addDependency(ope)
//let q = OperationQueue()
//q.addOperations([ope, ope1], waitUntilFinished: true)
//q.cancelAllOperations()

var a  = [1, 9, 8, 4, 0, 0, 2, 7, 0, 6, 0, 9]

var count  = 0
for index in 0..<a.count {
    if a[index] != 0 {
        a[count] = a[index]
        count = count + 1
    }
}


for index in count..<a.count {
   a[index] = 0
}

print(a)

// String Append

var stringReading = "ABCD"
var adding = "ABCDE"
var length = 0

while length < stringReading.count {
    let index = stringReading.index(stringReading.startIndex, offsetBy: length)
    //print("\(stringReading[index])")
    if length % 2 == 0 {
        stringReading.insert("A", at: index)
    }
    length = length + 1
    
}
print(stringReading)

length = 0
var secondIndex = 1
while length < adding.count {
    let index = adding.index(adding.startIndex, offsetBy: length)
    let addingIndex = stringReading.index(stringReading.startIndex, offsetBy: secondIndex)
    stringReading.insert(adding[index], at: addingIndex)
    length = length + 1
    secondIndex = secondIndex + 1
}

print(stringReading)


// Linked List in Swift

class node {
    var value: Int
    var next: node?
    
    init(value:Int) {
        self.value = value
    }
    
    func append() {
        let nodeObject = node(value:5)
        
        
    }
}

/*let queue = DispatchQueue(label: "com.gcd.myQueue", attributes: .concurrent)
let semaphore = DispatchSemaphore(value: 3)
for i in 0 ... 15 {
    queue.async {
        let songNumber = i + 1
        semaphore.wait()
        print("Downloading song", songNumber)
        sleep(2) // Download take ~2 sec each
        print("Downloaded song", songNumber)
        semaphore.signal()
    }
}*/

// Protocol
protocol someProtocol {
    func printName()
    var mustBeSet: Int {get set}
    var onlyGet: Int {get}
}

class myClass: someProtocol {
    var onlyGet: Int
    
    var mustBeSet: Int
    
    func printName() {
        print("My name is Subrat")
    }
    init(getvalue:Int) {
        self.mustBeSet = 5
        self.onlyGet = getvalue
    }
    func value()->Int {
        return onlyGet
    }
}

protocol FullyNamed {
    var fullName: String {get}
}

class name: FullyNamed {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String {
        return self.firstName + self.lastName
    }

}
let n = name(firstName: "Subrat", lastName: "Kheti")
print(n.fullName)


class myOperation1: Operation {
    private var _executing: Bool = false
    private var _finished: Bool =  false
    
    override init() {
        
    }
    override var isExecuting: Bool {
        get {
            return _executing
        }
        set {
            guard _executing != newValue else {
                return
                
            }
            willChangeValue(forKey: "isExecuting")
            _executing = newValue
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    override var isFinished: Bool {
        get {
            return _finished
        }
        set {
            guard _finished != newValue else {
                return
                
            }
            willChangeValue(forKey: "isFinished")
            _finished = newValue
            didChangeValue(forKey: "isFinished")
        }
    }
    

    override func start() {
        print("Start method is called for myOperation1")
        URLSession.shared.dataTask(with: URL(string: "https://api.github.com/users/shashikant86")!) { (data, response, errro) in
            print(data!)
            self.isFinished = true
        }.resume()
    }
    
    override func main() {
        print("main method is called myOperation1")
    }
}

class myOperation2: Operation {
    override func start() {
        print("Start methos is called myOperation2")
    }
    
    override func main() {
        print("main method is called myOperation2")
    }
}


class myOperation3: Operation {
    override func start() {
        print("Start methos is called myOperation3")
    }
    
    override func main() {
        print("main method is called myOperation3")
    }
}

var que = OperationQueue()
var ope1 = myOperation1()
var ope2 = myOperation2()
var ope3 = myOperation3()

ope2 .addDependency(ope1)

//que.addOperations([ope1, ope2], waitUntilFinished: true)


protocol area {
    func area()
}

struct traingle:area {
    var a: Int
    var b: Int
    var c: Int
    
    init(ar: Int, br:Int, cr:Int) {
        a = ar
        b = br
        c = cr
    }
    
    func area() {
        let area = a * b * c
        print("\(area)")
    }
    
    
}

var clso  = { (a: Int, b:Int)->(Int) in  return a + b}

print("The value is \(clso(4, 5))")


var myArray1 = [1, 2, 3, 4, 5]
myArray.map({(a:Int) -> (Int) in return a * 10})
print(myArray)


func myFunc(a: Int, b: Int, d:(Int, Int)->(Int)) {
    let c = a + b + d(6, 7)
    print("The value is \(c)")
}
myFunc(a:5, b: 6, d:{(c: Int, d:Int)->(Int) in
    print("Closure is called")
    return c + d
})




let values = [1, 0, 0, 1, 1, 0, 1, 0]
var cfArray = 0
var fArray = values.filter({(a:Int)->(Bool) in
    if a != 0 {
        return true
        
    } else {
        cfArray = cfArray + 1
        return false
    }
})


for _ in 0..<cfArray {
    fArray.append(0)
}
print(fArray)


var oneArray = [1, 3, 4, 5, 6]
var totalOneArray = oneArray.count

//for (j,k) in zip(range1, range2) {
//    print("The value of j is \(j) and value of k is \(k)")
//}

var first = 0
var second = totalOneArray - 1
for i in 0..<totalOneArray/2 {
    var temp = 0
    temp = oneArray[first]
    oneArray[first] = oneArray[second]
    oneArray[second] = temp
    first = first + 1
    second = second - 1
}
print(oneArray)

struct Stack1 {
    var array = [Int]()
    mutating func push(value: Int) {
        array.append(value)
    }
    mutating func pop() -> Int {
        let v = array.last
        array.removeLast()
        if let v = v {
            return v
        }
        return -1
    }
}

var s = Stack1()
s.push(value: 1)
s.push(value: 3)
s.push(value: 5)

print("The value is \(s.pop())")

func myFunc(a: Int, b: Int, completion:(Int)->(Void)) {
    let v = 10
    completion(v)
    
}

myFunc(a: 5, b: 6) { (c:Int) -> (Void) in
    print("The value is \(c)")
}


struct git:Codable {
    var login: String
    var url: String
    
    init(login:String, url:String) {
        self.login = login
        self.url = url
    }
}



/*func load(url:String, completion:@escaping (git)->()) {
    URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
        if error !=  nil {
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(git.self, from: data!)
                completion(gitData)
            } catch let errro {
                print(error)
            }
            
        } else {
            print("something is wrong")
        }
    }.resume()
    
}

load(url: "https://api.github.com/users/shashikant86") { (git) in
    print("The first value is \(git.login)")
}*/


func gcdTesting() {
    print("Started")
    let qu = DispatchQueue(label: "com.serial.test")
    qu.sync {
        print("hello")
    }
    qu.sync {
        print("one more hello")
    }
    print("Finsihed")
    
}
gcdTesting()


