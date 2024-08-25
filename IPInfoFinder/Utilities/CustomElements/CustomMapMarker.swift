//
//  CustomMapMarker.swift
//  IPInfoFinder
//
//  Created by artem on 25.08.2024.
//

import SwiftUI

struct CustomMapMarker: View {
    var body: some View {
        Image(Constants.customMarker)
            .resizable()
            .scaledToFit()
            .frame(width: 44, height: 30.8)
    }
}
