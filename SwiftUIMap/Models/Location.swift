//
//  Location.swift
//  SwiftUIMap
//
//  Created by 강준영 on 2023/03/16.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        return name + cityName
    }
}

