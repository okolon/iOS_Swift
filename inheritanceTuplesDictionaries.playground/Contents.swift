import UIKit

// dictionary example
let avgRate = [
    "Golden Dragon": 4.59,
    "Half Moon Bay": 4.17
]

for (key, value) in avgRate {
    if value < 4.50 {
        print("The cheapest is \(key)")
    }
}

//tuples example
var chineseShops = (name: "Golden Dragon", rate: 4.1)

func getRating() -> Double {
    return chineseShops.rate
}

print("I want that shop with a rating of \(getRating())")

//inheritance exmaple

class Cuisine {
    let type: String
    
    init(type: String) {
        self.type = type
    }
}

class Chinese: Cuisine {
    var name: String
    var rating: Double
    var avgPrice: Double
    
    init(name: String, rating: Double, avgPrice: Double) {
        self.name = name
        self.rating = rating
        self.avgPrice = avgPrice
        
        super.init(type: "Chinese")
    }
}

let goldenD = Chinese(name: "Golden Dragon", rating: 4.59, avgPrice: 5.90)

print(goldenD.avgPrice)

