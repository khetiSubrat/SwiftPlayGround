import UIKit

var str = "Hello, playground"

var mutex = NSLock()
//let serialQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)
/*let serialQueue = DispatchQueue(label: "com.queue.Serial")
serialQueue.async {
    for i in 0...10  {
        if i % 2 == 0 {
            mutex.lock()
            print("The even is ------> \(i)")
            mutex.unlock()
        }
    }
}
//print("task2 is created")
serialQueue.async {
    for i in 0...10  {
        if i % 2 != 0 {
            mutex.lock()
            print("The odd is ------> \(i)")
            mutex.unlock()
        }
    }
}*/
//print("task4 is created")


// Dispatch_Group
/*let parrelQueue = DispatchQueue(label:"com.queue.Concurrent", attributes: .concurrent)

let group = DispatchGroup()

parrelQueue.async {
    group.enter()
    for i in 0...10 {
        print("The value is \(i)")
    }
    group.leave()
}

parrelQueue.async {
    group.enter()
    for i in 11...20 {
        print("The value is \(i)")
    }
    group.leave()
}

group.notify(queue: DispatchQueue.main) {
    print("Both the things are completed")
}

//parrelQueue.async {
//    print("Both the things are completed")
//}*/


// Barriere

class ThereadSafeCollection {
    private let queue = DispatchQueue(label: "Dispathch", attributes: .concurrent)
    
    private var _elements = [Int]()
    
    var elements:[Int] {
        var r:[Int] = []
        queue.sync {
           r = _elements
        }
        return r
    }
    
    func appendToArray(_ el: Int) {
        queue.async(flags: .barrier) {
            self._elements.append(el)
        }
    }
}


