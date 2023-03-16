//
//  LocationsViewModel.swift
//  SwiftUIMap
//
//  Created by 강준영 on 2023/03/16.
//

import SwiftUI
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
    
    // 이 값이 변경되는데 전체 다시그림
    @Published var showLocationList: Bool = false
    
    init() {
        self.locations = LocationsDataService.locations
        self.mapLocation = LocationsDataService.locations.first!
        self.updateMapRegion(location: LocationsDataService.locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
            mapRegion = MKCoordinateRegion(center: location.coordinates,
                                           span: mapSpan)
        
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationList = !showLocationList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false
        }
    }
}
