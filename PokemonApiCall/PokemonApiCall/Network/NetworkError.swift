//
//  NetworkError.swift
//  PokemonApiCall
//
//  Created by Norman Okolo on 15/05/2023.
//

import Foundation

enum NetworkError {
    case apiEndPointError
    case parsingError
    case invalidUrlError
    case imageDoesNotExist
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .apiEndPointError:
            return NSLocalizedString("Api endpoint does not exist.", comment: "Endpoint error")
        case .parsingError:
            return NSLocalizedString("Data is not decodable/parsable.", comment: "Parsing error")
        case .invalidUrlError:
            return NSLocalizedString("Invalid URL check for type", comment: "Invalid URL error")
        case .imageDoesNotExist:
            return NSLocalizedString("Invalid URl check for type", comment: "Image does not exist")
        }
    }
}
