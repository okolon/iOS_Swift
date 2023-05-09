//
//  DetailScreen.swift
//  PokemonApiCall
//
//  Created by Norman Okolo on 25/04/2023.
//

import SwiftUI

struct DetailScreen: View {
    let pokemon: PokemonEntity
    
    var body: some View {
        VStack(spacing: 20) {
                    RemoteImage(url: pokemon.images.large)
                        .frame(width: 400, height: 400)
                    Text(pokemon.name)
                        .font(.title)
                        .fontWeight(.heavy)
                        .fontDesign(.rounded)
            HStack {
                if let evolvesFrom = pokemon.evolvesFrom {
                    Text("Evolves From: \(evolvesFrom)")
                }
                
                if (pokemon.evolvesFrom != nil) && pokemon.evolvesTo != nil {
                    Text("||")
                }
                if let evolvesTo = pokemon.evolvesTo {
                    Text("Evolves To: \(evolvesTo.joined(separator: ", "))")
                }
            }
                    Spacer()
                }
                .padding()
                .navigationBarTitle(Text(pokemon.name))
    }
}

struct RemoteImage: View {
    let url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                Image(systemName: "photo")
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                Image(systemName: "exclamationmark.triangle")
            @unknown default:
                Image(systemName: "photo")
            }
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(pokemon: PokemonEntity.init(name: "", evolvesFrom: "", images: CardImages(small: "", large: ""), evolvesTo: [""]))
    }
}
