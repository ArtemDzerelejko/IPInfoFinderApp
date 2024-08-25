//
//  NetworkError.swift
//  IPInfoFinder
//
//  Created by artem on 25.08.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError(Error)
    case httpError(statusCode: Int)
    case networkFailure(Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response from the server"
        case .decodingError(let error):
            return "Failed to decode the response: \(error.localizedDescription)"
        case .httpError(let statusCode):
            return "HTTP error with status code: \(statusCode)"
        case .networkFailure(let error):
            return "Network failure: \(error.localizedDescription)"
        }
    }
}
