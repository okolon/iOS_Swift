//
//  CoreDataProtocol.swift
//  PokemonCoreData
//
//  Created by Norman Okolo on 02/05/2023.
//

import Foundation

protocol CoreDataOperationProtocol {
    func saveDataInDatabase(pokeList:[PokemonObject]) async throws
    func getFromDatabase() -> [PokemonObject]

}
