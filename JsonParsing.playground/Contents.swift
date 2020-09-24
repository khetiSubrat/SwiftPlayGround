import UIKit

var str = "Hello, playground"

let json = """
[
    {
        "name": "Home Town Market",
        "aisles": [
            {
                "name": "Produce",
                "shelves": [
                    {
                        "name": "Discount Produce",
                        "product": {
                            "name": "Banana",
                            "points": 200,
                            "description": "A banana that's perfectly ripe."
                        }
                    }
                ]
            }
        ]
    },
    {
        "name": "Big City Market",
        "aisles": [
            {
                "name": "Sale Aisle",
                "shelves": [
                    {
                        "name": "Seasonal Sale",
                        "product": {
                            "name": "Chestnuts",
                            "points": 700,
                            "description": "Chestnuts that were roasted over an open fire."
                        }
                    },
                    {
                        "name": "Last Season's Clearance",
                        "product": {
                            "name": "Pumpkin Seeds",
                            "points": 400,
                            "description": "Seeds harvested from a pumpkin."
                        }
                    }
                ]
            }
        ]
    }
]
""".data(using: .utf8)!

print(json)


struct Product: Codable {
    let name: String
    let points: Int
    let description: String
}


struct Shelves: Codable {
    let name: String
    let product: Product
}


struct Aisles: Codable {
    let name: String
    let shelves: [Shelves]
}

struct GrocerryStore: Codable {
    let name: String
    let aisles: [Aisles]
}

struct ServiceStore  {
    var s = [GrocerryStore]()
    
}


do {
    let d = try JSONDecoder().decode([GrocerryStore].self, from: json)
    let ss = ServiceStore(s: d)
    print(ss.s.count)
    print(d[0])
}catch {
    print(error)
}
