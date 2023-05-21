//
//  Coordinator.swift
//  Map_Locations
//
//  Created by Norman Okolo on 12/05/2023.
//

import Foundation
import SwiftUI
import CoreLocation

class Coordinator: ObservableObject {
    @Published var navigationPath = NavigationPath()
    
//    func startCoordinator() {
//
//    }
    
    func goToDetailScreen() {
        navigationPath.append(MyPage.detailScreen)
    }
    
    func goToContentView() {
        navigationPath.append(MyPage.contentScreen)
    }
    
    @ViewBuilder
    func getMyPage(page:MyPage) -> some View {
        switch page {
        case .contentScreen: ContentView()
        case .detailScreen:
            DetailView(place: Places(name: "Old Street", coordinates: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.0075)))
        }
    }
}

enum MyPage {
    case contentScreen
    case detailScreen
}
