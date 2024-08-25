//
//  MapPin.swift
//  IPInfoFinder
//
//  Created by artem on 25.08.2024.
//

import MapKit

struct MapPin: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
