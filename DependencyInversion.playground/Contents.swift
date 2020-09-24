import UIKit

var str = "Hello, playground"


/*class SomeClass {
    var child:SomeotherClass
    
    init(child:SomeotherClass ) {
        self.child = child
    }
}


class SomeotherClass {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

let someotherClass = SomeotherClass(name: "Subrat")
let someClass = SomeClass(child: someotherClass)
print(someClass)*/


// MARK: DIP

protocol Nameable {
    var name: String { get }
}

class SomeClass {
    var child:SomeotherClass
    
    init(child:SomeotherClass ) {
        self.child = child
    }
}


class SomeotherClass: Nameable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class SomeotherClassMock: Nameable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

let nameable = SomeotherClass(name: "Subrat")
let someClass = SomeClass(child: nameable)
print(someClass)

let nameable1 = SomeotherClassMock(name: "Subrat")
let someClass1 = SomeClass(child: nameable)
print(someClass1)

