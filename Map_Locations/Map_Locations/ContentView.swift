//
//  ContentView.swift
//  Map_Locations
//
//  Created by Norman Okolo on 10/05/2023.
//

import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {
    
    @StateObject var viewModel = LocationManager()
    
    @State var staticRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.083321), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var region: Binding<MKCoordinateRegion>? {
        guard let currentLocation = viewModel.currentLocation else {
            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.526217, longitude: -0.083321), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)).getBinding()
        }
        
        let region = MKCoordinateRegion(center: currentLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        
        return region.getBinding()
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    if let currentRegion = region {
    //                    Map(coordinateRegion: currentRegion)
                        Map(coordinateRegion: currentRegion, annotationItems: [Places(name: "Old Street", coordinates: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.0075))]) { pin in
                            
                            MapAnnotation(coordinate: pin.coordinates) {
                                NavigationLink {
                                    DetailView(place: pin)
                                } label: {
                                    PinImage()
                                        .frame(width: 100, height: 100)
                                }
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
