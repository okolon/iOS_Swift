//
//  Entity.swift
//  ViperArchitectureForApiCall
//
//  Created by Norman Okolo on 16/05/2023.
//

import Foundation

struct ProductEntity: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
