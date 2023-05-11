//
//  Profile.swift
//  DesignPatterns
//
//  Created by Norman Okolo on 04/05/2023.
//

import Foundation

class UserProfile: ObservableObject {
    static let shared = UserProfile()

    @Published var name = "James"
    @Published var age = 0
    @Published var favCuisine = ""
}
