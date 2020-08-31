import UIKit

var str = "Hello, playground"

var op1 = BlockOperation.init {
    print("My Operation1")
    
}

var op2 = BlockOperation.init {
   print("My Operation2")
    
}

let opq = OperationQueue()
op2.addDependency(op1)
opq.addOperations([op1, op2], waitUntilFinished: true)
print("Done")


struct GitData:Decodable {
    let login: String
}

class BaseOperation: Operation {
    private var _executing = false {
        willSet {
            willChangeValue(forKey: "isExecuting")
        }
        didSet{
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    override var isExecuting: Bool {
        return _executing
    }
    
    private var _finished = false {
        willSet {
            willChangeValue(forKey: "isFinished")
        }
        didSet{
            didChangeValue(forKey: "isFinished")
        }
    }
    
    override var isFinished:Bool {
        return _finished
    }
    
    func executing(_ exe:Bool) {
        _executing = exe
    }
    
    func finish(_ fin:Bool) {
        _finished = fin
    }
}

class MyOperation: BaseOperation {
    override func start() {
        URLSession.shared.dataTask(with: URL(string: "https://api.github.com/users/shashikant86")!) { (data, response, error) in
            print(data ?? "")
            self.executing(false)
            self.finish(true)
        }.resume()
    }
}

let op = MyOperation()
op.start()
op.completionBlock = {()->() in
    print("all task are done")
}


class MyClass {
    init() {
        self.name = "Kanchan"
    }

    var name: String {
        willSet {
            print("The old value is \(name)")
        }
        didSet {
           print("The new value is \(name)")
        }
    }
    
    var test: String {
        get {
            return name
        }
        set {
            name = newValue
        }
    }
}

var myClass = MyClass()
myClass.name = "Subrat"
myClass.name = "Super"
myClass.test = "Happy"
print(myClass.name)

// New OperationTest

class FirstOperation: Operation {
    
    private var _isExecuting = false {
        willSet {
            willChangeValue(forKey: "isExecuting")
        }
        didSet {
            willChangeValue(forKey: "isExecuting")
        }
    }
    
    private var _isFinished = false {
        willSet {
            willChangeValue(forKey: "isFinished")
        }
        didSet {
            willChangeValue(forKey: "isFinished")
        }
    }
    
    override func main() {
        
    }
    override func start() {
        
    }
    
    func finished(_ isFinished: Bool) {
        _isFinished = isFinished
    }
}

class SecondOperation: Operation {
    
    private var _isExecuting = false {
        willSet {
             willChangeValue(forKey: "isExecuting")
        }
        didSet {
             willChangeValue(forKey: "isExecuting")
        }
    }
    
    private var _isFinished = false {
        willSet {
            willChangeValue(forKey: "isFinished")
        }
        didSet {
            willChangeValue(forKey: "isFinished")
        }
    }
    
    override func main() {
        
    }
    override func start() {
        
    }
}

var firstOperation = FirstOperation()
var secondOperation = SecondOperation()

let queue = OperationQueue()
queue.addOperations([firstOperation, secondOperation], waitUntilFinished: true)
