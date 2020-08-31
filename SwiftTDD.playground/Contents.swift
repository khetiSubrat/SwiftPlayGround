import UIKit

import XCTest

var str = "Hello, playground"


final class TitleViewController {
    var titlelabel = UILabel()
    
    convenience init(title: String) {
         
    }
}

class HowToTest: XCTest {
    
    func testRenderViewController_From_ViewModel() {
        // given
        let viewController = TitleViewController()
        
        // when
        
        // then
        
        XCTAssert(viewController.titlelabel.text, "title")
    }
}
