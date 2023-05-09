//
//  CoreDataManager.swift
//  PokemonCoreData
//
//  Created by Norman Okolo on 02/05/2023.
//

import Foundation
import CoreData

class CoreDataManager: CoreDataOperationProtocol {
    
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveDataInDatabase(pokeList: [PokemonObject]) {
        pokeList.forEach { pokemon in
            let entity = PokemonModelEntity(context: context)
            entity.name = pokemon.name
            entity.evolvesFrom = pokemon.evolvesFrom
            entity.evolvesTo = pokemon.evolvesTo as? String
            
            let imageEntity = PokemonImageEntity(context: context)
            imageEntity.small = pokemon.images.small
            imageEntity.large = pokemon.images.large
            
            entity.images = imageEntity
        }
        do {
            try context.save()
            print("data saved successfully into database")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func getFromDatabase() -> [PokemonObject] {
        return []
    }
    
    
}
