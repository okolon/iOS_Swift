import UIKit

struct Shops {
    var name : String
    var cuisine : String
    var avgPrice : Double
    var isClosed : Bool
}

let shop1 = Shops(name: "Morleys", cuisine: "Chicken", avgPrice: 3.78, isClosed: true)
let shop2 = Shops(name: "King Kebab", cuisine: "Kebab", avgPrice: 7.89, isClosed: false)
let shop3 = Shops(name: "Golden Dragon", cuisine: "Chinese", avgPrice: 5.12, isClosed: false)

var prompt = "You want to go to \(shop1.name) which on average costs \(shop1.avgPrice)"

print(prompt)

struct Profile {
    var personName : String?
    var favCuis : String?
}

let person = Profile()

if let unwrapped = person.personName {
    print("\(unwrapped)")
} else {
    print("Missing field")
}

func check() {
    guard let unwrapped = person.favCuis else {
        print ("You don't have a preferred a name")
        return
    }
    print("Your favourite \(unwrapped)")
}

let kebab = ["King Kebab", "Mo's Kebab", "Shawarma Palace"]

print(kebab[2].count)

for item in kebab {
    print(item)
}
