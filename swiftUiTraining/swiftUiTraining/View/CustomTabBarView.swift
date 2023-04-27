//
//  CustomTabBarView.swift
//  swiftUiTraining
//
//  Created by Norman Okolo on 21/04/2023.
//

import SwiftUI

struct CustomTabBarView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.gray
    }
    var body: some View {
        TabView{
            ListScreen().tabItem {
                Image(systemName: "list.bullet")
                Text("List")
            }
            GridView().tabItem {
                Image(systemName: "square.grid.3x3")
                Text("Grid")
            }
            ImageScreen().tabItem {
                Image(systemName: "photo.fill")
                Text("Image")
            }
            QuantityScreen().tabItem {
                Image(systemName: "basket.fill")
                Text("Shop")
            }
            GameScreen().tabItem {
                Image(systemName: "gamecontroller.fill")
                Text("Game")
            }
        }.tint(.white)
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView()
    }
}
