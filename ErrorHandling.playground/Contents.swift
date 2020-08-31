import UIKit

var str = "Hello, playground"


print("***********************************")
enum VendingMachineError: Error {
    case insufficientBalalnce(Int)
    case itemNotFound
    case unknownError
}


func buyItemfromVendingMachine(_ price: Int, _ item: String) throws {
    if price < 50 {
        throw VendingMachineError.insufficientBalalnce(50 - 20)
    }
    
    if item != "Coka" {
        throw VendingMachineError.itemNotFound
    }
    
}

do {
    try buyItemfromVendingMachine(60, "Coka")
} catch VendingMachineError.insufficientBalalnce(let v) {
   print("Not enough balance \(v)")
} catch VendingMachineError.itemNotFound {
   print("Items not found")
}

print("***********************************")

enum ErrorValue: String {
    case errro1
    case errro2
    case errro3
}



let v = ErrorValue.errro1
print(v)


struct User {
    let name: String
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        
        self.name = name
    }
}

let user = User(name: "")


enum Validate: Error {
    case emptyName(String)
}

struct User1 {
    let name: String
    
    init(name: String) throws {
        if name.isEmpty {
            throw Validate.emptyName("Please pass a valid name")
        }
        
        self.name = name
    }
}

do {
    let user  = try User1(name: "")
} catch Validate.emptyName(let s) {
    print(s)
}


print("***********************************")

enum FoodError: Error {
    case rotten(String)
    case waste
    case notavilable(String)
}

func foodItem(_ item: String) throws {
    if item == "Apple" {
        throw FoodError.rotten("The food is rotten")
    } else if item == "Mango" {
        throw FoodError.notavilable("The mango is not available")
    } else if item == "Pineapple" {
        throw FoodError.waste
    }
}

do {
    try foodItem("Apple")
} catch FoodError.notavilable(let str) {
    print(str)
} catch FoodError.rotten(let str) {
    print(str)
} catch FoodError.waste {
    print("waste")
}

print("***********************************")
