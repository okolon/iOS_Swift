//
//  NetworkManager.swift
//  PokemonApiCall
//
//  Created by Norman Okolo on 25/04/2023.
//

import Foundation

struct NetworkManager: NetworkableProtocol {
    func getDataFromApi(url: URL) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        }catch let error{
            throw error
        }
    }
}
