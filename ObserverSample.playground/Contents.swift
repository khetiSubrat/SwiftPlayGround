import UIKit

var str = "Hello, playground"


class MyClass: NSObject {
    @objc dynamic var variable = 5
    @objc dynamic var anotherVariable = 1
    var donotObserveMe = 1
    override init() {
        self.variable = 10
    }
}

var c = MyClass()
c.setValue(11, forKey: #keyPath(MyClass.variable))

class MyObserver: NSObject {
    var value: MyClass
    var myContext = 1
    init(value: MyClass) {
        self.value = value
        super.init()
        self.value.addObserver(self,
                          forKeyPath: #keyPath(MyClass.variable),
                          options: .new,
                          context: &myContext)
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        if context == &myContext {
            let newValue = change?[.newKey] as? NSObject
            let oldValue = change?[.oldKey] as? NSObject
            print("The new value is \(String(describing: newValue)) and old value is \(String(describing: oldValue))")
            print("Change at keyPath = \(String(describing: keyPath)) for \(String(describing: object))")
        }
        
    }
    deinit {
        self.value.removeObserver(self, forKeyPath: #keyPath(MyClass.variable))
    }
}

var observed = MyClass()
var o = MyObserver(value:observed)

observed.variable = 42          //Change notification!
observed.anotherVariable = 0    //No notification.

/*class Children: NSObject {
    @objc dynamic var name: String
    @objc dynamic var age: Int
    
    override init() {
        self.name = "Subrat"
        self.age = 33
        
        super.init()
    }
}



// Design a Observer Pattern
class myClass {
    private var myInt: Int
    var value:Int {
        get {
            return self.myInt
        }
        set {
            self.myInt = newValue
        }
    }
    init(myInt: Int) {
        self.myInt = 10
    }
}

class myObserver {
    var myClosure:(Int)->()
    init(myClosure:@escaping (Int)->()) {
        self.myClosure = myClosure
    }
}


// Bindiing

class ViewModel<T> {
    typealias Observer = (T)->()
    var name: T {
        didSet {
            self.observer?(name)
        }
    }
    init(name: T) {
        self.name = name
    }
    var observer: Observer?
    
    func bind(listner: @escaping Observer) {
        self.observer =  listner
    }
    
}

class View {
    var model: ViewModel<String>?
    var myName: String?
    init(model: ViewModel<String>) {
        self.model = model
        self.myName = self.model?.name
    }
}


var viewModel = ViewModel(name: "Subrat")
var view = View(model: viewModel)
var closure = {(val)->() in
    view.myName = val
}
viewModel.bind(listner: closure)
print(view.myName)
viewModel.name = "Kumar"
print(view.myName)*/
