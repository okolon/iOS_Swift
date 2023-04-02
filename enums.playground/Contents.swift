import UIKit

//enums are a collection of related data types

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
    case expensive(price: Int)
    case notBad(price: Int)
    case cheap(price: Int)
}

func getKebabPrice(for option: kebabPrices) {
    switch option {
    case .expensive(price: let price) where >=
    }
}

