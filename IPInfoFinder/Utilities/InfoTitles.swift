//
//  InfoTitles.swift
//  IPInfoFinder
//
//  Created by artem on 25.08.2024.
//

import Foundation

struct InfoTitles {
    private static func title(_ value: String) -> String {
        return value + ":"
    }
    
    static let ip = title("IP")
    static let hostname = title("Hostname")
    static let city = title("City")
    static let region = title("Region")
    static let country = title("Country")
    static let location = title("Location")
    static let organization = title("Organization")
    static let postal = title("Postal")
    static let timezone = title("Timezone")
    static let readme = title("Readme")
}
