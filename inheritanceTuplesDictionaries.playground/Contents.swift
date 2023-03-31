import UIKit

let avgPrice = [
    "Golden Dragon": 5.98,
    "Half Moon Bay": 5.17
]

for (key, value) in avgPrice {
    if value < 5.50 {
        print("The cheapest is \(key)")
    }
}
