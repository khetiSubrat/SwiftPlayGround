import UIKit

var str = "Hello, playground"

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var name: String?
}

let resolution = Resolution(width: 50, height: 70)

let videoMode = VideoMode()
videoMode.name = "First Instance"

let videoMode2 = videoMode
videoMode2.name =  "Second Instance"

let videoMode3 =  videoMode2

if videoMode === videoMode3 {
    print("Identical")
} else {
    print("Not Identical")
}

struct mySize {
    var name: Int
    var age: Int
}

let mysize = mySize(name:5, age: 6)

// MARK: Computed Property

struct Employee {
    private var totalSalary = 72000
    
    var monthSalary: Int {
        get {
            return totalSalary / 12
        }
        set {
             self.totalSalary = newValue * 12
        }
    }
}

var employee = Employee()
print("The monthly salary is \(employee.monthSalary)")
employee.monthSalary = 4000


class selfTest {
    var name: String
    var age: Int
    init(name1: String, age: Int) {
        name = name1
        self.age = age
    }
}


var test = selfTest(name1: "Subrat", age: 42)
print(test.name)

class PrivateVarTesting {
    private var number: Int?
    init() {
    }
    /*var need: Int {
        get {
            return self.number
        }
        set {
            self.number = newValue
        }
    }*/
}

//class oneClass: PrivateVarTesting {
//    var newNumber: Int
//    init(newNumber: Int) {
//        self.newNumber = newNumber
//        super.init()
//    }
//
//    override var number: Int {
//        get {
//
//        }
//        set {
//            willChangeValue(forKey: "number")
//            didChangeValue(forKey: "number")
//        }
//    }
//
//}


var myObject = PrivateVarTesting()
//myObject.need = 8
//print(myObject.need)


struct StudentData: Equatable {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    static func == (lhs: StudentData, rhs: StudentData) -> Bool {
        if lhs.age == rhs.age && lhs.name == rhs.name {
            return true
        }
        return false
    }
}

let obj1  = StudentData(name: "Subrat", age: 33)
let obj2  = StudentData(name: "Subrat", age: 33)

if obj1 == obj2 {
    print("Both are same")
} else {
    print("Both are not same")
}


// Memory


class SimpleClass {
    var value: Int = 20
}
var x = SimpleClass()
var y = SimpleClass()
let closure = { [x, y] in
    print(x.value, y.value)
}

x.value = 10
y.value = 10
closure()



struct User {
    var name: String
    var rollNumber: Int
}

var user = User(name: "Subrat", rollNumber: 23)

func change(name: inout String, rollNumber: inout Int) {
    
}

// MARK: Value and Reference combination
func print(address o: UnsafeRawPointer ) {
    print(String(format: "%p", Int(bitPattern: o)))
}

class Company:NSCopying {
    var name: String = "Confidential"
    
    func copy(with zone: NSZone? = nil) -> Any {
        let newCopy =  Company()
        newCopy.name = name
        return newCopy
    }

    deinit {
        print("Deinitializing Company")
    }
}


struct Employee1 {
    private var _employer: Company
    let name: String
    var employer: Company {
        mutating get {
            if !isKnownUniquelyReferenced(&_employer) {
                _employer = _employer.copy() as! Company
            }
            return _employer
        }
        set {
             _employer = newValue
        }
    }
    
    init(name: String, employer: Company = Company()) {
        self.name = name
        self._employer = employer
    }
}

var peter = Employee1(name: "Peter")
peter.employer.name = "Facebook"

var gary = Employee1(name: "Gary")
gary.employer = peter.employer

print(peter.employer.name) //Facebook
print(gary.employer.name)  //Facebook
gary.employer.name = "Google"

print(peter.employer.name) //Google
print(gary.employer.name)  //Google


/*A personD class with variables personName and personAge*/
/*We have to confirm NSCopying protocol and implement func copy(with zone: NSZone? = nil) -> Any*/
class PersonD : NSCopying {
    var personName : String?
    var personAge : Int?
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = PersonD()
        copy.personName = self.personName
        copy.personAge = self.personAge
        return copy
    }
}
    //lets create person object
    let personObj = PersonD()
    
    //lets set person properties
    personObj.personName = "Alok"
    personObj.personAge = 18
    
    /*lets create a another person object and assign personObj.
     we will use copy method now to perform deep copy.
     we have to make sure PersonD confirms to NSCopying protocol
     and implements func copy(with zone: NSZone? = nil) -> Any*/
    let personObjAnother = personObj.copy() as! PersonD
    
    //lets set personObjAnother properties
    personObjAnother.personName = "Naitvik"
    personObjAnother.personAge = 3
    
    //lets print personObj
    print(personObj.personName!) //prints "Alok"
    print(personObj.personAge!)  //prints 18
    
    //lets print personObjAnother
    print(personObjAnother.personName!) //prints "Naitvik"
    print(personObjAnother.personAge!)  //prints 3



//

class Student:NSObject, NSCopying {
    var name: String?
    func copy(with zone: NSZone? = nil) -> Any {
        let v = Student()
        v.name = self.name
        return v
    }
    
}

struct DB {
    var age: Int
    var student: Student?
}

var d = DB(age: 32, student: Student())
d.student?.name = "Subrat"

var e = d
e.student?.name = "rinky"
e.age = 26

print("The details \(d.age) and \(String(describing: d.student?.name)) and \(e.age)  and \(e.student?.name)")

let stud = Student()
let array:[Any] = [1, "Subrat", d, stud]

for i in 0..<array.count {
    switch array[i] {
    case is Int:
        print("This is Int")
    case is AnyClass:
        print("This is a struct")
    case is String:
        print("This is a String")
    default:
        print("This is deafult")
    }

}


// MARK:  Private vs FilePrivate


class PrivateTesting {
    private var myVar =  15
    init(myVar: Int) {
        self.myVar = myVar
    }
    
    private func updatemyVar() {
        self.myVar = 30
    }
    
    func printMyVar() {
        print("The value is \(self.myVar)")
    }
}

extension PrivateTesting  {
    func updatetoNewValue() {
        
        print("The value is \(self.myVar)")
    }
}


let t = PrivateTesting(myVar: 40)
//.updatemyVar()
t.printMyVar()
t.updatetoNewValue()



print("*************************")

/*struct Address {
  var streetAddress: String
  var city: String
  var state: String
  var postalCode: String
}

class Person {          // Reference type
  var name: String      // Value type
  var address: Address  // Value type

  init(name: String, address: Address) {
    self.name = name
    self.address = address
  }
}


let kingsLanding = Address(
  streetAddress: "1 King Way",
  city: "Kings Landing",
  state: "Westeros",
  postalCode: "12345")
let madKing = Person(name: "Aerys", address: kingsLanding)
let kingSlayer = Person(name: "Jaime", address: kingsLanding)

// 2
kingSlayer.address.streetAddress = "1 King Way Apt. 1"

// 3
madKing.address.streetAddress  // 1 King Way
kingSlayer.address.streetAddress // 1 King Way Apt. 1

class Customer {
    var name: String
    var address:Address
    var array:[Int]
    init(name: String, array:[Int], address: Address) {
        self.name = name
        self.array = array
        self.address = address
    }
}

let array1 = [1, 2, 3, 4, 5]
let address1 = Address(zip: 5)
let customer = Customer(name: "Subrat", array: array1, address: address1)

let nCustomer =  customer
nCustomer.name = "Rinky"
nCustomer.address.zip = 7
nCustomer.array.append(6)

print("The value of arrays are \(nCustomer.address.zip) and \(customer.address.zip)")*/

