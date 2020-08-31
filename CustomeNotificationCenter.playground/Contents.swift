import UIKit

var str = "Hello, playground"

class CustomNotificationCenter {
    static let notificationCenter = CustomNotificationCenter()
    var dictionary = [String: ()->()]()
    private init() {}
    
    func addNotification(name: String, method:@escaping()->()) {
        self.dictionary[name] = method
    }
    
    func excuteMethod(name: String) {
        guard let v = self.dictionary[name] else { return  }
        v()
    }
    
    func removeObserver(name: String) {
        self.dictionary.removeValue(forKey: name)
    }
}


class MyClass {
    init() {
       addAObserver()
    }
    func addAObserver() {
        let center = CustomNotificationCenter.notificationCenter
        var method = {()->() in
            print("The value is")
        }
        center.addNotification(name: "ClassA", method: method)
    }
}

class MyClassB {
    init() {
        let center = CustomNotificationCenter.notificationCenter
        center.excuteMethod(name: "ClassA")
    }
}

let a = MyClass()
let b = MyClassB()


