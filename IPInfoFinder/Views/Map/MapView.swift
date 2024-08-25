//
//  MapView.swift
//  IPInfoFinder
//
//  Created by artem on 22.08.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: Properties
    @StateObject private var viewModel: MapViewModel
    @State private var region: MKCoordinateRegion
    @Environment(\.presentationMode) private var presentationMode
    
    init(latitude: Double, longitude: Double, cityName: String) {
        let vm = MapViewModel(latitude: latitude, longitude: longitude, cityName: cityName)
        _viewModel = StateObject(wrappedValue: vm)
        _region = State(initialValue: vm.initialRegion)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            mapLayer
            overlayLayer
        }
        .navigationBarHidden(true)
        .colorScheme(.light)
        .preferredColorScheme(.light)
    }
}

// MARK: - MapView Components
private extension MapView {
    // MARK: Map Layer
    var mapLayer: some View {
        Map(coordinateRegion: $region, annotationItems: [viewModel.mapPin]) { pin in
            MapAnnotation(coordinate: pin.coordinate) {
                CustomMapMarker()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var overlayLayer: some View {
        VStack {
            headerBar
            Spacer()
        }
    }
    
    // MARK: Header Bar
    var headerBar: some View {
        HStack {
            backButton
            Spacer()
            cityNameLabel
            Spacer()
        }
        .padding()
        .background(Color.white)
    }
    
    // MARK: Back Button
    var backButton: some View {
        Button(action: { presentationMode.wrappedValue.dismiss() }) {
            Image(Constants.chevronForMap)
                .imageScale(.large)
        }
    }
    
    // MARK: City Name Label
    var cityNameLabel: some View {
        Text(viewModel.cityName)
            .font(AppFont.headlineThree)
    }
}
