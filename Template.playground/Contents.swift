import UIKit

var str = "Hello, playground"


func add<T: Numeric>(a: T, b: T) {
    print("The value is \(a + b)")
}

add(a:5.7, b:6.8)

class Stack<T> {
    var container = [T]()
    func push(element: T) {
        self.container.append(element)
    }
}

let s = Stack<Int>()
s.push(element: 5)
s.push(element: 6)
s.push(element: 7)


func findIndex<T: Equatable>(searchIndex: T, fromStringArray:[T]) -> Int? {
    for(index, searchValue) in fromStringArray.enumerated() {
        if searchValue == searchIndex {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
let v = findIndex(searchIndex: "llama", fromStringArray: strings)
print("The value is \(String(describing: v))")


struct GenericStruct<T> {
    var property: T
}

let value = GenericStruct<String>(property: "Hello")

protocol NormalProtocol {
    var property: String {get set}
}

protocol oneProtocol {
    associatedtype genericProperty
    var property: genericProperty {get set}
    func myFunc()
}

extension oneProtocol {
    func myFunc() {
        print("Test")
    }
}

class someProtocol: oneProtocol {
    typealias genericProperty = String
    var property: genericProperty = "Bob"
    func myNew() {
        myFunc()
    }
}

var value1 = someProtocol()
value1.myFunc()

