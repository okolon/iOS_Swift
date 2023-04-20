import UIKit


// Default initialisers
// creates new instance where all the variables have their default values
class kebabShop {
var name: String?
var cuisine = "Kebab"
var aboveFourStars = false
}
var KingKebab = kebabShop()

// Memberwise Initializers
// - if no values have been passed into struct, the initialiser is given with parameters that need to be passed
struct Basket {
    let size: Int
    let isEmpty: Bool
}

let myShopping = Basket(size: 4, isEmpty: false)

// Custom initializers
// - you can add custom initialisation to a class/struct with custom parameters
struct Person {
    let faveCuisine: String
    let name: String
    
    init(faveCuisine: String, name: String) {
        self.name = name
        self.faveCuisine = faveCuisine
    }
}

let me = Person(faveCuisine: "Chinese", name: "Norman")
// Requireed initializers
// - implement initialiser in the subclass
class Vehicle {
    
}


// Failable initializer
// - this is an initaliser that moght or might not work
struct Password {
    var passW: Int
    
    init?(passW: Int) {
        if passW > 6 {
            self.passW = passW
        } else {
            return nil
        }
    }
}

Password(passW: 4)
