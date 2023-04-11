import UIKit

enum Cuisines: CaseIterable {
    case chinese
    case chicken
    case kebab
    case mexican
    case carribean
    case italian
// function giving the enums values.
    func whichFood() -> String{
        switch self{
            
        case .chinese:
            return "I want chinese"
        case .chicken:
            return "I want chicken and chips"
        case .kebab:
            return "I want kebab"
        case .mexican:
            return "I want mexican"
        case .carribean:
            return "I want carribean"
        case .italian:
            return "I want italian"
        }
    }
}


let food = Cuisines.kebab
print(food.whichFood())

for munch in Cuisines.allCases {
    print(munch)
}

//Raw value Enum

enum ClosestShop:String, CaseIterable {
    case kingKebab = "0.7miles away"
    case perfectChicken = "0.3miles away"
    case authenticGrill = "0.1miles away"
}


func foodLocator(shop: ClosestShop) -> String
{
    return shop.rawValue
}

foodLocator(shop: .kingKebab)

//associatited type enum

enum kebabPrices{
    case lambDonner(price: Double)
    case shawarma(price: Double)
    case burgerAndChips(price: Double)
}

func priceRange(for option: kebabPrices) {
    
    switch option {
        
    case .lambDonner(price: let price) where price >= 9.00:
        print("This is an expensive kebab")
    
    case .shawarma(price: let price) where price >= 8.00:
        print("This price is not bad for kebab")
    
    case .burgerAndChips(price: let price) where price >= 7.00:
        print("This price is really good")
        
    default:
        print("You don't have enough money for this food")
    }
}

priceRange(for: .burgerAndChips(price: 7.80))

enum CheckoutProtocol{
    case IncorrectCardDetails
    case InvalidDiscountCode
    case CheckoutSessionTimeout
    
    var errorMsg: String {
        switch self {
        case .IncorrectCardDetails:
            return "These card details are incorrect. Try again"
        
        case .InvalidDiscountCode:
            return "This discount code is invalid"
            
        case .CheckoutSessionTimeout:
            return "Session timeout. You must start again"
        }
    }
}

let errorAtCheckout = CheckoutProtocol.InvalidDiscountCode

func displayError(error: CheckoutProtocol) {
    print(error.errorMsg)
}

displayError(error: errorAtCheckout)

// protocals
protocol Walking {
    func destinationReached(distance: Double)
    func nearlyThere(distance: Double)
}

class Person: Walking {
    
    func destinationReached(distance: Double) {
        if distance == 0 {
            print("You're at your food spot. Enjoy!")
        }
        
        else {
            print("Not there yet")
        }
    }
    
    func nearlyThere(distance: Double) {
        if distance > 0 {
            print("You are \(distance) away from the shop")
        }
    }
}

//methods and properties
protocol footballPosters {
    var price: Int { get }
    var quantity: Int { get set }
    
    func checkBasket()
}

protocol trainingKits: footballPosters {
    var instock: Bool { get set }
    var colour: String { get set }
}

class basket: trainingKits {
    var instock = true
    
    var colour = "blue"
    
    var price = 34
    
    var quantity = 2
    
    func checkBasket() {
        if instock {
            print("The basket has \(quantity) kits of total £\(price * (quantity))")
        }
    }
    
}

let basketOne = basket()
basketOne.checkBasket()

//extension

protocol SizeGuide {
    var Clothefit: String { get set }
    func getFit()
}

class Customer {
    let height: Double
    var age: Int
    var Clothefit: String
    
    init(height: Double, age: Int, Clothefit: String) {
        self.height = height
        self.age = age
        self.age = 22
        self.Clothefit = "loose"
    }
}

extension Customer: SizeGuide {
    func statement() {
         print("You are \(age)")
    }
    
    func getFit() {
        if Clothefit == "loose" {
            print("Your size guide suggests a \(Clothefit) fit")
        }
    }
}

let newCust = Customer(height: 183, age: 24, Clothefit: "Loose")
newCust.getFit()

