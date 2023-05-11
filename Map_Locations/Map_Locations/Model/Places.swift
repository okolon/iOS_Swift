//
//  Places.swift
//  Map_Locations
//
//  Created by Norman Okolo on 11/05/2023.
//

import Foundation
import CoreLocation

struct Places: Identifiable {
    let id = UUID()
    let name : String
    let coordinates : CLLocationCoordinate2D
}
