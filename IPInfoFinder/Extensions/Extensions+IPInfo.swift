//
//  Extensions+IPInfo.swift
//  IPInfoFinder
//
//  Created by artem on 25.08.2024.
//

import Foundation

extension IPInfo {
    var latitude: Double {
        Double(loc.split(separator: ",")[0]) ?? 0.0
    }
    
    var longitude: Double {
        Double(loc.split(separator: ",")[1]) ?? 0.0
    }
}
