//
//  ListView.swift
//  PokemonApiCall
//
//  Created by Norman Okolo on 25/04/2023.
//

import SwiftUI
import CoreData

struct ListView: View {
    
    @State var isErrorOccured = false
    
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var pokemonViewModel : PokemonViewModel = PokemonViewModel(manager: NetworkManager())

//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
    
    let fetchRequest: NSFetchRequest<PokemonModelEntity> = PokemonModelEntity.fetchRequest()
    
    @FetchRequest(entity: PokemonModelEntity.entity(), sortDescriptors: [])
    var results: FetchedResults<PokemonModelEntity>
    

    
    var body: some View {
        NavigationStack{
            VStack{
                List(results){ pokemon in
                    NavigationLink {
                        DetailScreen(pokemon: pokemon)
                    } label: {
                        CustomListCell(thing: pokemon.name ?? "")
                    }
                }
                
            Spacer()
            }.task {
                await pokemonViewModel.getPokemon(urlString: APIEndPoint.pokemonListEndPoint, viewContext: viewContext)
                guard let url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {return}
                                    
                                    let sqlitePath = url.appendingPathComponent("PokemonCoreData.sqlite")
                                    print(sqlitePath)
            }.refreshable {
                await pokemonViewModel.getPokemon(urlString: APIEndPoint.pokemonListEndPoint, viewContext: viewContext)
            }
            .navigationTitle(Text("POKEDEX"))
            .navigationBarTitleDisplayMode(.inline)
            }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(pokemonViewModel: PokemonViewModel(manager: NetworkManager()))
    }
}
