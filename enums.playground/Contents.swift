import UIKit

//enums are a collection of related data types

enum Cuisines: CaseIterable {
    case chinese
    case chicken
    case kebab
    case mexican
    case carribean
    case italian
    
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

enum KebabMenu:String, CaseIterable {
    case sides = "Chips, Samosas, Popcorn chicken"
    case mains = "Shawarma, Chicken Kebab, Burger and Chips"
    case drinks = "Fanta, Water, Coke, Rio, Ting"
}
