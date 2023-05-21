//
//  NavigationPage.swift
//  Map_Locations
//
//  Created by Norman Okolo on 12/05/2023.
//

import SwiftUI

struct NavigationPage: View {
    
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
        coordinator.getMyPage(page: .contentScreen)
        .navigationDestination(for: MyPage.self) { navigation in
            coordinator.getMyPage(page: navigation)
            }
        }
    }
}

struct NavigationPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationPage().environmentObject(Coordinator())
    }
}
