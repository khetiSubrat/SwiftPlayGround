import UIKit
import Foundation
import Combine

var str = "Hello, playground"


struct Users: Codable {
    let id: Int
    let name: String
    let username: String
}


private let urls = "http://jsonplaceholder.typicode.com/users"

var userPublisher: AnyPublisher<[Users], Error> {
    return URLSession.shared.dataTaskPublisher(for: URL(string: urls)!)
        .map{$0.data}
        .decode(type: [Users].self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
}


var userSubscriber:AnyCancellable?
userSubscriber = userPublisher.sink(receiveCompletion: { _ in
    print("complted")
}, receiveValue: { (users) in
    print(users)
})

// Publisher - Deliver a Sequence of value over time
// Subscriber - Subscrive to publisher to get value

//let publisher:AnyPublisher = Publishers.Just("Combine Swift")

enum WeatherError: Error {
    case thingJustHappen
}

let weatherPublisher = PassthroughSubject<Int, Never>()

/*let subsriber = weatherPublisher
    .filter { $0 > 25 }
    .sink{(value: Int) -> () in
    print("A summer day of \(value)") }*/


let anotherSubscriber = weatherPublisher
    .handleEvents(receiveSubscription: { (subscription) in
        print("The subscription is \(subscription)")
    },
                  receiveOutput: { (output) in
                    print("The output is \(output)")
    },
                  receiveCompletion: { (error) in
                    print("The error is \(error)")
    },
                  receiveCancel: {
                    print("Canceled")
    }).filter{ $0 > 25 }
      .sink{ value in
        print("Subscriber received value is \(value)")
}

weatherPublisher.send(10)
weatherPublisher.send(20)
weatherPublisher.send(30)
weatherPublisher.send(40)


let publisher = PassthroughSubject<String, Error>()

let sub = publisher.sink(receiveCompletion: { (error) in
    print(error)
}) { (value) in
    print("The new value is \(value)")
}

publisher.send("Hello")
publisher.send("Hi")
publisher.send("Test")


// Just

let _ = Just("Hello Wprld")
    .sink { (value) in
        print("The value is \(value)")
}


//let myPublisher = PassthroughSubject(

var array = [1, 5, 9]
array.publisher.map{$0 * $0}.sink { (value) in
    print("The square value is \(value)")
}


