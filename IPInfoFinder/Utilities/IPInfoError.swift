//
//  IPInfoError.swift
//  IPInfoFinder
//
//  Created by artem on 25.08.2024.
//

import Foundation

enum IPInfoError: Error, Identifiable {
    case invalidIPAddress
    case networkError
    case serverError
    case dataParsingError
    case clientError(statusCode: Int)
    case unknownError(String)
    
    var id: String {
        switch self {
        case .invalidIPAddress: return "invalidIPAddress"
        case .networkError: return "networkError"
        case .serverError: return "serverError"
        case .dataParsingError: return "dataParsingError"
        case .clientError(let statusCode): return "clientError:\(statusCode)"
        case .unknownError(let description): return "unknownError:\(description)"
        }
    }
    
    var message: String {
        switch self {
        case .invalidIPAddress:
            return "Invalid IP address. Please check and try again."
        case .networkError:
            return "Network error. Please check your internet connection and try again."
        case .serverError:
            return "Server error. Please try again later."
        case .dataParsingError:
            return "Error parsing data. Please try again."
        case .clientError(let statusCode):
            return "Client error with status code: \(statusCode). Please check your request and try again."
        case .unknownError(let description):
            return "An unknown error occurred: \(description)"
        }
    }
}
