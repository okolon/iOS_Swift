//
//  Restaurant.swift
//  DesignPatterns
//
//  Created by Norman Okolo on 05/05/2023.
//

import Foundation
import SwiftUI

// Protocol for creating resturaunts
protocol Restaurants {
    func showChinese(_ name: String) -> Text
    func showMexican(_ name: String) -> Text
    func showJapanese(_ name: String) -> Text
}

// Factory class that creates resturaunts
class NewRestauarants: Restaurants {
    func showMexican(_ name: String) -> Text {
        Text("\(name)")
    }
    
    func showJapanese(_ name: String) -> Text {
        Text("\(name)")
    }
    
    func showChinese(_ name: String) -> Text {
        Text("\(name)")
    }
}



