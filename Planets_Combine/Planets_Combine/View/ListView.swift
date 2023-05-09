//
//  ListView.swift
//  Planets_Combine
//
//  Created by Norman Okolo on 08/05/2023.
//

import SwiftUI
import Combine

struct ListView: View {
    
    @StateObject var planetViewModel = PlantesViewModel(networkable: NetworkManager())
    
    @State var searchText: String = ""
    
    var body: some View {
//            Color(.black)
//                .ignoresSafeArea()
            NavigationStack {
                    VStack {
                        Button ("Cancel ongoing request") {
                            planetViewModel.cancelApiRequest()
                        }
                        List(planetViewModel.filteredPlanetList){
                                planet in NavigationLink {
                                    DetailsView(planetName: planet.name)
                                } label: {
                                    CustomCell(labelOne: planet.name)
                                }
                        }.onAppear() {
                            planetViewModel.getPlanets(apiUrl: APIEndpoint.planetAPI)
                        }.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                            .onChange(of: searchText, perform: {searchWord in
                                print(searchWord)
                                planetViewModel.searchPlanets(searchWord: searchWord)
                            })

                    }
            }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
