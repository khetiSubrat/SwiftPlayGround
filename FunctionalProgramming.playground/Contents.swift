import UIKit

var str = "Hello, playground"

struct Contact {
    var fName: String
    var lName: String
    
    var email: String
}


let contacts = [
    Contact(fName: "Subrat", lName: "Kheti", email: "Empty"),
    Contact(fName: "Kanchan", lName: "Mahakur", email: "Empty")

]

var contactName = [String]()
//for c in contacts {
//    let name = c.fName + c.lName
//    contactName.append(name)
//}
//
//print(contactName)
contactName = contacts.map({(c: Contact)->(String) in
    return c.fName + c.lName
})

var myString = "Hey How are You"

let s = myString.components(separatedBy: " ").map({(c: String)->(String) in
    return c.capitalized
})

print(s)


func +<key, value>(lhs: [key: value], rhs: [key: value])

let jonAge = ["John", 28]
let mAge = ["marry", 26]

let age = jonAge + mAge
print(age)
