//
//  DetailView.swift
//  Map_Locations
//
//  Created by Norman Okolo on 10/05/2023.
//

import SwiftUI
import CoreLocation

struct DetailView: View {
    
    var place: Places
    
    var body: some View {
        VStack {
            Text("\(place.name)")
                .font(.title)
                .padding(.bottom, 100)
                .fontWeight(.heavy)
            Text("Long: \(place.coordinates.longitude)")
                .padding(.bottom, 30)
            Text("Lat: \(place.coordinates.latitude)")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(place: Places(name: "Old Street", coordinates: CLLocationCoordinate2D(latitude: 51.5, longitude: 0.0075)))
    }
}
