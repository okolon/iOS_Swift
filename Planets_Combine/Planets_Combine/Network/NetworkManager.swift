//
//  NetworkManager.swift
//  Planets_Combine
//
//  Created by Norman Okolo on 08/05/2023.
//

import Foundation
import Combine

class NetworkManager: NetworkableProtocol {
    
    func getPlanetFromApi<T>(url: URL, type: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        return URLSession.shared.dataTaskPublisher(for: url)
            .delay(for: .seconds(5.0), scheduler: DispatchQueue.main)
            .map{$0.data}
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                return error
            }
            .eraseToAnyPublisher()
    }
    
    
}
