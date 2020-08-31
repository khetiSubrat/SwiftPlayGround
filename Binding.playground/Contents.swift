import UIKit

var str = "Hello, playground"
class GenericDynamic<T> {
    typealias Observer = (T)->()
    var observer:Observer?
    
    func bind(_ listner: Observer?) {
        self.observer = listner
    }
    var value: T {
        didSet {
            self.observer?(value)
        }
    }
    
    init(_ v: T) {
        self.value = v
    }
}

class MyClass {
    var myGeneric: GenericDynamic<String>?
    var valueToUpdate:String?
    func setup() {
        self.myGeneric = GenericDynamic("Hello")
        var myClosure = {(val:String)->() in
            self.valueToUpdate = val
            print("The new value is \(String(describing: self.valueToUpdate))")
        }
        self.myGeneric?.bind(myClosure)
    }
}

var obj =  MyClass()
obj.setup()
obj.myGeneric?.value = "Update"

