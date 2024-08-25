//
//  Extensions+NetworkError.swift
//  IPInfoFinder
//
//  Created by artem on 25.08.2024.
//

import Foundation

extension NetworkError {
    var asIPInfoError: IPInfoError {
        switch self {
        case .invalidURL:
            return .invalidIPAddress
        case .networkFailure:
            return .networkError
        case .invalidResponse:
            return .serverError
        case .decodingError:
            return .dataParsingError
        case .httpError(let statusCode):
            switch statusCode {
            case 400...499:
                return .clientError(statusCode: statusCode)
            case 500...599:
                return .serverError
            default:
                return .unknownError("Unexpected HTTP status code: \(statusCode)")
            }
        }
    }
}
