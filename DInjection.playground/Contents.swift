import UIKit

var str = "Hello, playground"




struct Library {
    
}

struct MyClass {
    var lib = Library()
}


// Property Injection

struct MyClassP {
    var lib: Library?
}

var c = MyClassP()
let l = Library()
c.lib = l
// Constructor Injection
struct MyClassC {
    var lib: Library
    init(_ lib: Library) {
        self.lib = lib
    }
}


// Method Injection
