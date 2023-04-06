import UIKit

let prices = [12.99, 34.50, 46.99]

if true {
    print("You have \(prices.count) items in your basket")
}

for items in prices {
    print(items)
}

if (prices.last != 0 && prices.first != 0) {
    print(prices[1])
    }


var quantity: Int = 0
while quantity < 5 {
    quantity += 1
    print(quantity)
    
    if quantity == 4 {
        print("You can only add one more item!")
    }
}


class Chelsea {
    var posterCollection: [String] = ["Drogba", "Lampard", "Hazard"]
    var totalProducts: Int = 35
}

extension Chelsea {
    func selectPosters () {
            print("\nWe have\(posterCollection) posters")
        }
}
let chelseaFC = Chelsea()
    chelseaFC.selectPosters()

// MARK: Map - modifies

var footballPosters: [String] = ["Cantona", "Ronaldo", "Zola", "Rooney"]
let inStock: [Bool] = footballPosters.map({ $0.isEmpty})

print("\n", inStock)


// reduces - returns sum of elements

var basket: [Double] = [23.99, 14.99, 39.99]
let total = basket.reduce(0, {$0 + $1})

print("\nTotal of £\(total)")

//filter

let users: [String] = ["Bushan", "Humza", "Payam", "Mohammed", "Tai", "Isaiah", "Glen", "Norman"]
let onlyAs = users.filter( {$0.contains("a")})

print("\n", onlyAs)

//sorted

struct Kits {
    let kitName: String
    let kitStock: Int
}

let kitStock: [Kits] =
[Kits(kitName: "90-91 Chelsea kit", kitStock: 7)]
[Kits(kitName: "02-03 Arsenal kit", kitStock: 34)]
[Kits(kitName: "96-97 Liverpool kit", kitStock: 98)]

let sortStock = kitStock.sorted{ $0.kitStock < $1.kitStock}

//let stockCount = ["90 Chelsea Kit": 7, "99 Arsenal kit": 34, "97 Liverpool kit": 17]
//let sortStock = stockCount.sorted(by: <)

print("\n", sortStock)
