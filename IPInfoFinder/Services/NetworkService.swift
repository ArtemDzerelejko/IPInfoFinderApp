//
//  NetworkService.swift
//  IPInfoFinder
//
//  Created by artem on 21.08.2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchIPInfo(for ip: String) async throws -> IPInfo
    func fetchUserIP() async throws -> IPResponse
}

class NetworkService: NetworkServiceProtocol {
    // MARK: Dependencies
    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder
    
    init(urlSession: URLSession = .shared, jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.urlSession = urlSession
        self.jsonDecoder = jsonDecoder
    }
}

// MARK: - NetworkServiceProtocol Methods
extension NetworkService {
    func fetchIPInfo(for ip: String) async throws -> IPInfo {
        let urlString = "\(Constants.ipInfoBaseURL)/\(ip)/geo"
        return try await performRequest(urlString: urlString)
    }
    
    func fetchUserIP() async throws -> IPResponse {
        return try await performRequest(urlString: Constants.ipifyURL)
    }
}

// MARK: - Private Methods
private extension NetworkService {
    func performRequest<T: Decodable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await urlSession.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.httpError(statusCode: httpResponse.statusCode)
        }
        
        do {
            return try jsonDecoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
}
