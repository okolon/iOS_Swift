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
    @EnvironmentObject var coordinator: Coordinator
    let cuisines = ["Kebab", "Chinese", "Turkish", "Fish & Chips", "Mexican", "Japanese"]
    
    @State var staticRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.083321), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var region: Binding<MKCoordinateRegion>? {
        guard let currentLocation = viewModel.currentLocation else {
            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.526217, longitude: -0.083321), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)).getBinding()
        }
        
        let region = MKCoordinateRegion(center: currentLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        
        return region.getBinding()
    }
    
    var body: some View {
        ZStack {
            Color.init(red: 246 / 255, green: 117 / 255, blue: 113 / 255)
                .ignoresSafeArea()
            VStack {
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem()]) {
                        ForEach(cuisines, id: \.self) { item in
                                Text("\(item)")
                                    .frame(width: 120, height: 60)
                                    .background(Color.init(red: 246 / 255, green: 117 / 255, blue: 113 / 255))
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .overlay (
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 100, height: 50)
                                    )
                        }
                    }
                }.frame(height: 60)
                    .padding(.trailing, 10)
                    .padding(.leading, 10)
                    if let currentRegion = region {
                        Map(coordinateRegion: currentRegion, annotationItems: [Places(name: "Old Street", coordinates: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.0075))]) { pin in
                            
                            MapAnnotation(coordinate: pin.coordinates) {
                                Button {
                                    coordinator.goToDetailScreen()
                                } label: {
                                    PinImage()
                                        .frame(width: 100, height: 100)
                                }
                            }
                        }
                        .ignoresSafeArea()
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
