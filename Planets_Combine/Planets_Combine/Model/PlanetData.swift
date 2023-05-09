//
//  PlanetData.swift
//  Planets_Combine
//
//  Created by Norman Okolo on 08/05/2023.
//

import Foundation

struct PlanetData: Decodable {
    let count: Int
    let next: String
    let previous: JSONNull?
    let results: [PlanetEntity]
}

// MARK: - Result
struct PlanetEntity: Decodable, Identifiable {
    let id = UUID()
    let name, diameter: String
    let climate, gravity: String
    let population: String

    enum CodingKeys: String, CodingKey {
        case name
        case diameter, climate, gravity
        case population
    }
}


class JSONNull: Decodable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
