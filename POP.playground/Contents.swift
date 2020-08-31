import UIKit

var str = "Hello, playground"

protocol StackOperation{
    associatedtype ItemType
    var top: ItemType {get set}
    var items:[ItemType] {get set }
    func push(value: ItemType)
    func pop()
}

class Stack: StackOperation {
    var top: Int = -1
    
    var items: [Int] = [Int]()
    
    func push(value: Int) {
        self.top = self.top + 1
       self.items.append(value)
    }
    
    func pop() {
        self.top = self.top - 1
        self.items.removeLast()
    }
}

var stack = Stack()
stack.push(value: 1)
stack.push(value: 2)
stack.push(value: 3)
stack.push(value: 4)
print("The top element is \(stack.items[stack.top])")
stack.pop()
stack.push(value: 5)
stack.pop()
stack.push(value: 1)
stack.push(value: 1)


protocol NetworkingCall {
    
    func getUserId(url: URL, onSuccess:@escaping(Data)->(), onFailure:@escaping(Error)->())
    
}





class MyClass:NetworkingCall {
    func getUserId(url: URL, onSuccess:@escaping(Data)->(), onFailure:@escaping(Error)->()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            
            if let error = error {
                onFailure(error)
            } else {
                onSuccess(data)
            }
        }
    }
    
}

protocol FileHandlerWrite {
    func write()
}

protocol FileHandlerRead {
    func read()
}

protocol FileHandelerProtcol:FileHandlerWrite, FileHandlerRead {
    
}

typealias FileHandlerType1 = FileHandlerRead & FileHandlerWrite

struct FileHandler: FileHandlerType1 {
    func write() {
        print("read")
    }
    
    func read() {
        print("write")
    }
}


let handler = FileHandler()
handler.read()
handler.write()

protocol HasArea {
    var area: Double {get}
}

class Circle: HasArea {
    var area: Double =  5.0
}

class Rec: HasArea {
    var area: Double {
        return 3.27 * 5
    }
}

class Dog {

}

let c = Circle()
let r = Rec()
let d = Dog()

var myArray: [AnyObject] = [c, r, d]

for object in myArray {
    if let testob = object as? HasArea {
        print("The area is \(testob.area)")
    } else {
        print("doesn't conform")
    }
}




struct Student:Comparable {

    let name: String
    let age: Int
    
    
//    static func == (lhs: Student, rhs: Student)-> Bool {
//        if lhs.name == rhs.name {
//           return true
//        }
//
//        return false
//    }
    
    static func < (lhs: Student, rhs: Student) -> Bool {
        if lhs.age > rhs.age {
            return true
        }
        
        return false
    }
    

}


let s1 = Student(name: "Subrat", age: 23)
let s2 = Student(name: "k", age: 23)

if (s1 == s2) {
    print("Both are true")
} else {
    print("Both are not true")
}
