//
//  NetworkableProtocol.swift
//  Planets_Combine
//
//  Created by Norman Okolo on 08/05/2023.
//

import Foundation
import Combine

protocol NetworkableProtocol {
    func getPlanetFromApi <T:Decodable> (url:URL, type: T.Type) -> AnyPublisher<T, Error>
}
