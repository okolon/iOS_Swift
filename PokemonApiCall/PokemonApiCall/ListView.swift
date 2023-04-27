//
//  ListView.swift
//  PokemonApiCall
//
//  Created by Norman Okolo on 25/04/2023.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var pokemonViewModel : PokemonViewModel = PokemonViewModel(manager: NetworkManager())
    @State private var presentKeychain = false

    
    var body: some View {
        NavigationStack{
            VStack{
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .padding(.bottom, 100)
                List(pokemonViewModel.pokeList){ pokemon in
                    NavigationLink {
                        DetailScreen()
                    } label: {
                        CustomListCell(thing: pokemon.name)
                    }
                    
                }
                
                Button("keychain button") {
                    presentKeychain = true
                }.padding()
                    .sheet(isPresented: $presentKeychain) {
                        KeyChainScreen()
                    }
                
            Spacer()
            }.task {
                    await pokemonViewModel.getPokemon(urlString: APIEndPoint.pokemonListEndPoint)
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
