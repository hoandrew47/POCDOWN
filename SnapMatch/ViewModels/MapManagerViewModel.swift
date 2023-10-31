//
//  MapManagerViewModel.swift
//  SnapMatch
//
//  Created by Hoad Ad on 30/10/2023.
//

import Foundation
import MapKit


struct MapManagerViewModel {
    
    private let mapView: MKMapView
    
    
    // MARK: - LCM
    init(mapView: MKMapView){
        self.mapView = mapView
    }
    
    
    // MARK: - METHODS
    /**
            Set the map cordinates. Defaults to san franscisco
     */
    func setCordinates(lat: Double = 37.7749,
                       lng: Double = -122.4194,
                       regionRadius: CLLocationDistance = 1000){
        
        let location = CLLocation(latitude: lat, longitude: lng)
        
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                     latitudinalMeters: regionRadius,
                                                     longitudinalMeters: regionRadius)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
}
