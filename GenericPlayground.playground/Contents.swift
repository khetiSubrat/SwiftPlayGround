import UIKit

var str = "Hello, playground"

func swapTwoVariable<T>(a: inout T, b: inout T) {
    let t = a
    a = b
    b = t
}
var someInt = 10
var anotherInt = 20
swapTwoVariable(a: &someInt, b: &anotherInt)
print("\(someInt) and \(anotherInt)")

// Stack

struct Stack<T> {
    var items = [T]()
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var s = Stack<Int>()
s.push(10)
s.push(20)
s.push(30)
s.pop()
s.push(40)
print("The lat elemnet is \(String(describing: s.items.last))")
var s1 = Stack<String>()
s1.push("Hello")
s1.push("Bye")
s1.push("Go")
s1.pop()
s1.push("Gone")
print("The lat elemnet is \(String(describing: s1.items.last))")


protocol Addable {
    static func +(lhs: Self, rhs: Self) -> Self
}

func addingValue<T: Addable>(a: T, b: T) {
    let v = a + b
    print("The adding value is \(v)")
}

extension Int: Addable {}
extension String: Addable {}

addingValue(a: "Good", b: "Subrat")

func findIndex<T: Equatable>(value: T, fromArray: [T]) -> Int? {
    for (index, v) in fromArray.enumerated() {
        if v == value {
            return index
        }
    }
    return 0
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(value: "llama", fromArray: strings) {
    print("The index of llama is \(foundIndex)")
}

let integers = [3, 4, 5, 6, 7, 8]
if let foundIndex = findIndex(value: 7, fromArray: integers) {
    print("The index of seven is \(foundIndex)")
}


struct Student: Equatable {
    var name: String
    var age: Int
    
    static func == (lhs: Student, rhs: Student) -> Bool {
    if lhs.name == rhs.name {
        return true
        }
        
        return false
    }
}


let su = Student(name: "Subrt", age: 32)
let ka = Student(name: "Kanchan", age: 23)

if su == ka {
    print("Botha are same")
} else {
    print("Both are not same")
}

protocol NormalProtcol {
    associatedtype type
    var myProperty: type {get set}
}

class NormalClass: NormalProtcol {
    var myProperty: String = "hello"
}


class Node<T> {
    var data: T
    var next: Node?
    init(data: T) {
        self.data = data
    }
}


class LinkedList<T> {
    var root: Node<T>?
    init() {
        self.root = nil
    }
    
    func createLinkedList(data: T) {
        let node = Node(data: data)
        if self.root == nil {
            self.root = node
        } else {
            var ptr = self.root
            while ptr?.next != nil {
                ptr = ptr?.next
            }
            ptr?.next = node
        }
    }
    
    func printLinkedList() {
        var ptr = self.root
        
        while ptr != nil {
            print("The value is \(ptr?.data)")
            ptr = ptr?.next
        }
    }
}

var list = LinkedList<Int>()
list.createLinkedList(data: 1)
list.createLinkedList(data: 2)
list.createLinkedList(data: 3)
list.createLinkedList(data: 4)
list.createLinkedList(data: 5)
list.printLinkedList()


// Medium


protocol Specification {
    associatedtype T
    
    func isStatisfied(_ item: T) -> Bool
}

struct ColorSpecification: Specification {
    typealias T = Product
    
    var color: Color
    
    func isStatisfied(_ item: Product) -> Bool {
        if item.color == color {
            return true
        }
        
        return false
    }
    
}

struct SizeSpecification: Specification {
    typealias T = Product

    var size: Size

    func isStatisfied(_ item: Product) -> Bool {
        return item.size == size
    }
}

enum Size {
    case small
    case medium
    case large
}

enum Color {
    case red
    case blue
    case green
}

protocol Filter {
    associatedtype T

    func filter<Spec: Specification>(items: [T], specs: Spec) -> [T]
    where Spec.T == T
}


struct Product {
    var name: String
    var color: Color
    var size: Size
    
    static func filterProduct(_ products: [Product], size: Size)-> [Product] {
        var filterProduct = [Product]()
        for p in products where p.size == size {
            filterProduct.append(p)
        }
        
        return filterProduct
    }
}

struct ProductFilter: Filter {
    typealias T = Product
       
       func filter<Spec: Specification>(items: [Product], specs: Spec) -> [Product]
           where ProductFilter.T == Spec.T {
               var output = [T]()
               for item in items {
                   if specs.isStatisfied(item) {
                       output.append(item)
                   }
               }
               return output
       }
}

extension Product: CustomStringConvertible {
    var description: String {
        return "\(size) \(color) \(name)"
    }
}


let tree = Product(name: "tree", color: .green, size: .large)
let frog = Product(name: "frog", color: .green, size: .small)
let strawberry = Product(name: "strawberry", color: .red, size: .small)

var result = Product.filterProduct([tree, frog, strawberry], size: .small)
print(result)

let small = SizeSpecification(size: .small)

result = ProductFilter().filter(items: [tree, frog, strawberry], specs: small)
print(result)



protocol StackOperation {
    associatedtype T
    
    var array: [T] {get set}
    
    mutating func push(_ item: T)
    mutating func pop()
}


struct StackAss: StackOperation {

    typealias T = Int
    var array  = [T]()
    
    mutating func push( _ item: T) {
        self.array.append(item)
    }
    
    mutating func pop() {
        self.array.removeLast()
    }
}

var stack = StackAss()

stack.push(5)
stack.push(6)
stack.push(7)
stack.pop()

print(stack.array)
