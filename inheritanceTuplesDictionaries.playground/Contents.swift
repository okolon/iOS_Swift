import UIKit

// dictionary example
let avgPrice = [
    "Golden Dragon": 5.98,
    "Half Moon Bay": 5.17
]

for (key, value) in avgPrice {
    if value < 5.50 {
        print("The cheapest is \(key)")
    }
}

//tuples example
var chineseShops = (name: "Golden Dragon", rating: 4.1)

func getRating() -> Double {
    return chineseShops.rating
}

print("I want that shop with a rating of \(getRating())")

//inheritance exmaple

class  Cuisine {
    var type: String
    var menuSize: String
    
    init(type: String, menuSize: String) {
        self.type = type
        self.menuSize = menuSize
    }
}

class Chinese: Cuisine {
    var name: String
    var avgPrice: Double
    var rating: Double
    
    init(name: String, avgPrice: Double, rating: Double) {
        self.name = name
        self.avgPrice = avgPrice
        self.rating = rating
    }
}


var newChinese = Chinese(name: "Golden Dragon", avgPrice: 5.98, rating: 4.1)

print(newChinese.avgPrice)
