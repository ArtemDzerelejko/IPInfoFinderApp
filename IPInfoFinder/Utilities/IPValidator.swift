//
//  IPValidator.swift
//  IPInfoFinder
//
//  Created by artem on 25.08.2024.
//

import Foundation

struct IPValidator {
    // MARK: - Validation
    static func isValid(_ ip: String) -> Bool {
        let ipRegex = "\\b(?:\\d{1,3}\\.){3}\\d{1,3}\\b"
        let ipPredicate = NSPredicate(format: "SELF MATCHES %@", ipRegex)
        return ipPredicate.evaluate(with: ip)
    }
    
    // MARK: - Formatting
    static func formatInput(_ input: String) -> String {
        return String(String(input.filter { "0123456789.".contains($0) }).prefix(15))
    }
}
