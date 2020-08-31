import UIKit

var str = "Hello, playground"

//Generic
func swap<T>(a: inout T, b: inout T) {
    let temp: T?
    temp = a
    a = b
    b = temp!
}

var a = 10.20
var b = 20.30
print("The value of a: \(a) and b: \(b)" )
swap(a: &a, b: &b)
print("The change value of a: \(a) and b: \(b)" )

// STACK
struct Stack<Element> {
    var stackArray = [Element]()
    mutating func push(val: Element) {
        stackArray.append(val)
    }
    mutating func pop() {
        stackArray.removeLast()
    }
}
var stackObject = Stack<Int>()
stackObject.push(val: 1)
stackObject.push(val: 2)
stackObject.push(val: 3)
stackObject.push(val: 4)
stackObject.pop()
stackObject.pop()

let string = ["hello", "bye", "rinky"]


func findIndex<T: Equatable>(of: T, inArray:[T]) -> Int? {
    for(index, value) in inArray.enumerated() {
        if value == of {
            return index
        }
    }
    return nil
}

let index = findIndex(of: "bye", inArray: string)
let doubleIndex = findIndex(of: 9.3, inArray: [3.14159, 0.1, 0.25])

// Equtable
class StreetAddress {
    let name: String
    let street: String
    let unit:String?
    
    init(name: String, street: String, unit: String? = nil) {
        self.name = name
        self.street = street
        self.unit = unit
    }
}

extension StreetAddress: Equatable {
    static func == (lhs: StreetAddress, rhs: StreetAddress) -> Bool {
        if lhs == rhs {
            return lhs.name == rhs.name && lhs.street == rhs.street || lhs.unit == rhs.unit
        }
        return false
    }
}

protocol sample {
    func printed()
}

struct new: sample {
    func printed() {
        print("Hello")
    }
}

class Sample {
    var name: String
    init(name: String) {
        self.name = name;
    }
    lazy var closure: ()->(String) = {[unowned self] ()->(String) in
        return self.name
    }
    
}
var c = {()->(String) in
    return "Hello"
}
c()

var s = Sample(name: "Subrat")
print(s.closure());
print(s.closure())

//let queue = DispatchQueue(label: "com.gcd.myQueue", attributes: .concurrent)
//let semaphore = DispatchSemaphore(value: 3)
//for i in 0 ...< 15 {
//    queue.async {
//        let songNumber = i + 1
//        semaphore.wait()
//        print("Downloading song", songNumber)
//        sleep(2) // Download take ~2 sec each
//        print("Downloaded song", songNumber)
//        semaphore.signal()
//    }
//}


// Sample Response

//https://jsonplaceholder.typicode.com/posts

struct User: Codable {
    let userId: Int
    let id: Int
    let titleName: String
    let body: String
    
    private enum CodingKey: String, CodingKeys {
         case titleName = "title"
         case body
        
    }
}


URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/posts")!) { (data, response, error) in
    guard  let data = data else {
        fatalError()
    }
    
    let decoder = JSONDecoder()
    do {
         let value = try decoder.decode([User].self, from: data)
         print(value[0].titleName)
    } catch  {
        fatalError()
    }
   
   
}.resume()
