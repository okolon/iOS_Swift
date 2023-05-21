//
//  PokemonViewModel.swift
//  PokemonApiCall
//
//  Created by Norman Okolo on 25/04/2023.
//

import Foundation

class PokemonViewModel : ObservableObject{
   @Published var pokeList = PokemonData(data: [], page: 0, pageSize: 0, count: 0, totalCount: 0)
    
    
    
    var manager: NetworkableProtocol
    
    init(manager:NetworkableProtocol) {
        self.manager = manager
    }
    func getPokemon(urlString: String) async {
        guard let url = URL (string: urlString) else {
            return
        }
        do {
           let data = try await self.manager.getDataFromApi(url: url)
            let pokemondata = try JSONDecoder().decode(PokemonData.self, from: data)
            DispatchQueue.main.async {
                self.pokeList = pokemondata
            }
            print(pokemondata)
        }catch let error{
            print(error.localizedDescription)
        }
        
    }
}
