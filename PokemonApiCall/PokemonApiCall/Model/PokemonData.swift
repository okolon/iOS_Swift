//
//  PokemonData.swift
//  PokemonApiCall
//
//  Created by Norman Okolo on 24/04/2023.
//

import Foundation

struct PokemonData: Codable {
    let data: [PokemonEntity]
    let page, pageSize, count, totalCount: Int
}


struct PokemonEntity: Codable {
    let name: String
    let evolvesFrom: String?
    let images:    CardImages
    let evolvesTo: [String]?
}

struct CardImages: Codable {
    let small, large: String
}
