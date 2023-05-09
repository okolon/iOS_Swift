//
//  PokemonViewModel.swift
//  PokemonApiCall
//
//  Created by Norman Okolo on 25/04/2023.
//

import Foundation
import CoreData

class PokemonViewModel : ObservableObject{
    @Published var pokeList = [PokemonObject]()
//    @Published var customError : NetworkError?
    
    
    var manager: NetworkableProtocol
    
    init(manager:NetworkableProtocol) {
        self.manager = manager
    }
    
    func getPokemon(urlString: String, viewContext: NSManagedObjectContext) async {
        guard let url = URL (string: urlString) else {
            return
        }
        do {
           let data = try await self.manager.getDataFromApi(url: url)
            let pokemondata = try JSONDecoder().decode(PokemonData.self, from: data)
//            self.pokeList = pokemondata.data.map { pokemonEntity in
//                PokemonData(name: pokemonEntity.name, evolvesFrom: pokemonEntity.evolvesFrom, images: pokemonEntity.images, evolvesTo: pokemonEntity.evolvesTo)
//            }
            DispatchQueue.main.async {
                self.pokeList = pokemondata.data
            }
            print(pokemondata)
            
            let coreDataManager = CoreDataManager(context: viewContext)
            coreDataManager.saveDataInDatabase(pokeList: self.pokeList)
        }catch let error{
            print(error.localizedDescription)
        }
        
    }
}
