import UIKit

var str = "Hello, playground"


class MockURLSessionDataTask: URLSessionDataTask {
    private var closure: ()->(Void)
    
    init(closure: @escaping ()->(Void)) {
        self.closure = closure
    }
    
    override func resume() {
        self.closure()
    }
}


class MockURLSession: URLSession {
    typealias completion = (Data?, URLResponse?, Error?)->(Void)
    
    
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
//    override func dataTask(with url: URL, completionHandler: @escaping completion) -> URLSessionDataTask {
//            let dat
//
//
//        return MockURLSessionDataTask {
//            completion(data, )
//        }
//    }
    
}


//func webserviceCall<T: Codable>(endPoints: "bbb", completion: @escaping(Result<T, Error>)->(Void)) {
//
//}



protocol StackOperation {
    associatedtype T
    var array: [T] { get }
    mutating func push(item: T)
    mutating func pop()
}


struct Stack<G>:StackOperation {
    //typealias T = G
    
    var array: [G] = [G]()
    
    mutating func push(item: G) {
        array.append(item)
    }
    
    mutating func pop() {
        array.removeLast()
    }
}

var s = Stack<Int>()
s.push(item: 5)
s.push(item: 6)
print(s)


var s1 = Stack<String>()
s1.push(item: "hello")
s1.push(item: "hee")
print(s1)

