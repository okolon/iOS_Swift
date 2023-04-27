//
//  PokemonData.swift
//  PokemonApiCall
//
//  Created by Norman Okolo on 24/04/2023.
//

import Foundation

struct PokemonData: Decodable {
    let count: Int
    let next, previous: String?
    let results: [PokemonEntity]
}

struct PokemonEntity: Decodable {
    
    let name: String
    let url: String
}


struct Pokemon: Decodable, Identifiable {
    var id = UUID()
    
    let name: String
    let url: String
}

