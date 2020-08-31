import UIKit
import XCTest

var str = "Hello, playground"

struct Product {
    var name: String
    var price: Int
    
    mutating func applyCoupon(coupon: Coupon) {
        let multiplier = 1 - coupon.discount / 100
               price *= multiplier
    }
}

struct Coupon {
    var name: String
    var discount: Int
}


//class
class ProductTests: XCTestCase {
    func testApplyingCoupon() {
        var product = Product(name: "Book", price: 25)
        let coupon = Coupon(name: "Holiday Sale", discount: 20)
        product.applyCoupon(coupon:coupon)
        
        XCTAssertEqual(product.price, 20)

    }
}
