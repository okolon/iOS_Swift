//
//  ContentView.swift
//  DesignPatterns
//
//  Created by Norman Okolo on 04/05/2023.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    var users: UserProfile
    
    let foodSpots: NewRestauarants

//    init(foodSpots: NewRestauarants) {
//        self.foodSpots = foodSpots
//    }
//
    var body: some View {
        VStack {
            Text("Name: \(users.name)")
            Text("Age: \(users.age)")
            Text("Favourite food: \(users.favCuisine)")
            
            Text("Welcome to our restaurant!")
                            .font(.title)
                        Button(action: {
                            foodSpots.showMexican("El Dorado")
                            foodSpots.showJapanese("Wagamamas")
                            foodSpots.showChinese("Golden Dragon")
                        }) {
                            Text("Click here to see our name")
                                .font(.headline)
                        }
        }
        .padding()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
