//
//  LocationManager.swift
//  Map_Locations
//
//  Created by Norman Okolo on 10/05/2023.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI

//@MainActor
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var currentLocation: CLLocation?
    
    private var cllocationManager = CLLocationManager()
    
    override init() {
        super.init()
        cllocationManager.delegate = self
        cllocationManager.distanceFilter = kCLDistanceFilterNone
        cllocationManager.desiredAccuracy = kCLLocationAccuracyBest
        cllocationManager.requestWhenInUseAuthorization()
        cllocationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        DispatchQueue.main.async {
            self.currentLocation = location
            print(location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    
}

extension MKCoordinateRegion {
    func getBinding() -> Binding<MKCoordinateRegion>? {
        return Binding<MKCoordinateRegion>(.constant(self))
    }
}
