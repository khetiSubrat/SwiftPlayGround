import UIKit

var str = "Hello, playground"

protocol Observer {
    var id: Int {get}
    func update<T>(withNewValue:T)
}

protocol Observable {
    associatedtype T
    var value: T {get set}
    var observers: [Observer]{get set}
    
    func addObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyAllObservers<T>(withNewvalue: T)
}

class Varibale<T>:Observable {
    
    private var _value : T! = nil
    private var _observers : [Observer] = []
    
    var value : T {
        get {
            return self._value
        }
        set {
            self._value = newValue
            self.notifyAllObservers(withNewvalue: newValue)
        }
    }
    
    var observers : [Observer] {
        get {
            return self._observers
        }
        set {
            self._observers = newValue
        }
    }
    
    func addObserver(observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(observer: Observer) {
        
    }
    
    func notifyAllObservers<T>(withNewvalue: T) {
        for observer in observers {
            observer.update(withNewValue: withNewvalue)
        }
    }
}

class MyObserver : Observer {
    
    private var _id : Int = 0
    
    var id: Int {
        get {
            return self._id
        }
    }
    
    init(id: Int) {
        self._id = id
    }
    
    func update<T>(withNewValue: T) {
        print("Whoaa, observer #\(self.id) updated with new value : ", withNewValue)
    }
}

var obs1 = MyObserver(id: 1)
var obs2 = MyObserver(id: 2)
var obsv = Varibale<String>()
obsv.addObserver(observer: obs1)
obsv.addObserver(observer: obs2)
obsv.value = "Hello world"
obsv.removeObserver(observer: obs1)
obsv.value = "Obs1 removed, yey"

//KVC and KVO

class Person: NSObject {
    @objc dynamic var balance: Int
    var accountNumber: Int
    weak var deposit: Deposit?
    init(balance: Int, accountNumber: Int, deposit: Deposit) {
        self.balance = 0
        self.accountNumber = accountNumber
        self.deposit =  deposit
    }
    
    func observe() {
        self.deposit!.addObserver(self, forKeyPath: "total", options: [.new, .old], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("Update balance")
        if keyPath == "deposit" {
            guard let change = change else {
                return
            }
            
            if let oldValue = change[.oldKey] {
                print("Old value \(oldValue)")
            }
            
            if let newValue = change[.newKey]  {
                print("New value \(newValue)")
                
            }
        }
    }
}

class Deposit: NSObject {
    @objc dynamic var total: Int
    init(total: Int) {
        self.total = 0
    }
    
    func addMoney(money: Int) {
        self.total = money
    }
}

class Bank: NSObject {
    var person: Person
    var deposit: Deposit
    
    init(person: Person, deposit: Deposit) {
        self.person = person
        self.deposit = deposit
    }
    
    func observe() {
        self.person.addObserver(self, forKeyPath: "balance", options: [.new, .old], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("Update total")
        if keyPath == "balance" {
            guard let change = change else {
                return
            }
            
            if let oldValue = change[.oldKey] {
                print("Old value \(oldValue)")
            }
            
            if let newValue = change[.newKey]  {
                print("New value \(newValue)")
            }
            //print([NSKeyValueChangeKey.oldKey.raw])
        }
    }
    
}

var deposit = Deposit(total: 5)
var person = Person(balance: 0, accountNumber: 5, deposit: deposit)
person.observe()
deposit.setValue(100, forKey: "total")
var b = Bank(person: person, deposit: deposit)
b.observe()
person.setValue(10, forKey: "balance")


// New
