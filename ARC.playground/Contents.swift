import UIKit

var str = "Hello, playground"

class Person {
    let name:String
    init(name: String) {
        self.name = name
    }
    
    var apartment: Apartment?
    deinit {
        print("\(name) is being deallocated")
    }
}

class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    
    weak var tenant:Person?
    deinit {
        print("Apartment \(unit) is being deallocated")
    }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Applseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
