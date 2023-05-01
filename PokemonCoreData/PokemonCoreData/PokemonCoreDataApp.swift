//
//  PokemonCoreDataApp.swift
//  PokemonCoreData
//
//  Created by Norman Okolo on 30/04/2023.
//

import SwiftUI

@main
struct PokemonCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ListView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
