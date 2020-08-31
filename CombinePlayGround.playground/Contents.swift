import UIKit
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

let publisher:AnyPublisher = Publishers.Just("Combine Swift")
