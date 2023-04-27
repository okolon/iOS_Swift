//
//  PokemonApiCallApp.swift
//  PokemonApiCall
//
//  Created by Norman Okolo on 24/04/2023.
//

import SwiftUI

@main
struct PokemonApiCallApp: App {
    var body: some Scene {
        WindowGroup {
            ListView(pokemonViewModel: PokemonViewModel(manager: NetworkManager()))
        }
    }
}
