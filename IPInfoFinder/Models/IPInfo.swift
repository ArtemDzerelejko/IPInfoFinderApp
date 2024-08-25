//
//  IPInfo.swift
//  IPInfoFinder
//
//  Created by artem on 21.08.2024.
//

import Foundation

struct IPInfo: Codable {
    let ip: String
    let hostname: String
    let city: String
    let region: String
    let country: String
    let loc: String
    let org: String
    let postal: String
    let timezone: String
    let readme: String
}
