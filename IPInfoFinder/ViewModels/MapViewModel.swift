//
//  MapViewModel.swift
//  IPInfoFinder
//
//  Created by artem on 25.08.2024.
//

import MapKit

class MapViewModel: ObservableObject {
    let initialRegion: MKCoordinateRegion
    let mapPin: MapPin
    let cityName: String
    
    init(latitude: Double, longitude: Double, cityName: String) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.initialRegion = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        self.mapPin = MapPin(coordinate: coordinate)
        self.cityName = cityName
    }
}
