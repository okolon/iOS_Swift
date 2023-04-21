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
                Text("List")
            }
            ImageScreen().tabItem {
                Image(systemName: "photo.fill")
                Text("List")
            }
        }.tint(.white)
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView()
    }
}
