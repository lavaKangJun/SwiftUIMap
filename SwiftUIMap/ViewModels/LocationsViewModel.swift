//
//  LocationsViewModel.swift
//  SwiftUIMap
//
//  Created by 강준영 on 2023/03/16.
//

import Foundation
import MapKit

class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    init() {
        self.locations = LocationsDataService.locations
        self.mapLocation = LocationsDataService.locations.first!
        self.updateMapRegion(location: LocationsDataService.locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
            mapRegion = MKCoordinateRegion(center: location.coordinates,
                                           span: mapSpan)
        
    }
}
