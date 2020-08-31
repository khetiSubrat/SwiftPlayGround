import UIKit
import XCTest

var str = "Hello, playground"


enum State {
    case cold
    case hot
    case warm
}

func updateOnCoffe(state: State) -> String {
    switch state {
    case .cold:
      return "The coffe is cold"
    case .hot:
       return "The coffe is hot"
    case .warm:
        return "The coffe is warm"
    default:
        print("State is not defined")
    }
}

let r = updateOnCoffe(state: .cold)
print(r)

class CofeeTest: XCTestCase {
    
    func test_stateTestingCofee() {
        let state = State.hot
        
        XCTAssertEqual(updateOnCoffe(state: state), "Print the cofee is hot")
    }
}

