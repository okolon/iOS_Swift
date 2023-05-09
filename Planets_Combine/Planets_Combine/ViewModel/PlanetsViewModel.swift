//
//  PlanetsViewModel.swift
//  Planets_Combine
//
//  Created by Norman Okolo on 08/05/2023.
//

import Foundation
import Combine

class PlantesViewModel : ObservableObject {
    
    @Published var planetList: [PlanetEntity] = []
       
       @Published var filteredPlanetList: [PlanetEntity] = []
    
    let networkable: NetworkableProtocol
    private var cancelable = Set<AnyCancellable>()
    
    init(networkable: NetworkableProtocol) {
        self.networkable = networkable
    }
    
    func getPlanets(apiUrl: String) {
        guard let url = URL(string: apiUrl) else {
            return
        }
        self.networkable.getPlanetFromApi(url: url, type: PlanetData.self)
            .receive(on: RunLoop.main)
            .sink{ completion in
                switch completion {
                    
                case .finished:
                    print("Done")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }receiveValue: { planets in
                
                if !planets.results.isEmpty{
                    print(planets)
                    self.planetList = planets.results
                    self.filteredPlanetList = planets.results.sorted(by: {$0.name < $1.name})
                    
                } else {
                    //handle empty response here
                    
                    
                }
                
            }.store(in: &cancelable)
    }
    
    func searchPlanets(searchWord: String) {
        if searchWord.isEmpty {
            self.filteredPlanetList = self.planetList.sorted(by: {$0.name < $1.name})
            print("Search term is empty, so we are populating filtered planet list")

        } else {
            let filteredList = self.planetList.filter { planet in
                return planet.name.localizedCaseInsensitiveContains(searchWord)
            }
            self.filteredPlanetList = filteredList
        }
    }
    
    func cancelApiRequest () {
        print("Api call cancelled")
        cancelable.first?.cancel()
    }
    
}
