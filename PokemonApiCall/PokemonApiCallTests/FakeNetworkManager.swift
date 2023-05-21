//
//  FakeNetworkManager.swift
//  PokemonApiCallTests
//
//  Created by Norman Okolo on 15/05/2023.
//

import Foundation
@testable import PokemonApiCall

class FakeNetworkManager: NetworkableProtocol {
//    var resultArr = [User]()
    
    func getDataFromApi(url: URL) async throws -> Data {
        let bundle = Bundle(for:  FakeNetworkManager.self)
        
        guard let path = bundle.url(forResource: url.absoluteString, withExtension: "json")
        else {
            throw NetworkError.invalidUrlError
        }
        do {
            let data = try Data(contentsOf: path)
            return data
        } catch {
            throw NetworkError.parsingError
        }
    }    
}
