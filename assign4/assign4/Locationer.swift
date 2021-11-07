//
//  Locationer.swift
//  assign4
//
//  Created by Meisheng Liu on 11/5/21.
//

import Foundation
import CoreLocation
 
class Locationer: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locManager = CLLocationManager()
    @Published var location = CLLocationCoordinate2D(latitude: 37, longitude: -67)
    @Published var locationsArray : [CLLocationCoordinate2D] = []
    @Published var isStart = false
    
    override init() {
        super.init()
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.distanceFilter = 4
        locManager.requestWhenInUseAuthorization()
        locManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.last {
            location = CLLocationCoordinate2D(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
            
            if (isStart) {
                locationsArray.append(location)
            }
        }
    }
}
