//
//  NetworkableProtocol.swift
//  PokemonApiCall
//
//  Created by Norman Okolo on 25/04/2023.
//

import Foundation

protocol NetworkableProtocol {
    func getDataFromApi(url: URL) async throws -> Data 
}
