//
//  IPInfoViewModel.swift
//  IPInfoFinder
//
//  Created by artem on 25.08.2024.
//

import Foundation

class IPInfoViewModel: ObservableObject {
    
    // MARK: Published properties
    @Published private(set) var ipInfo: IPInfo?
    @Published private(set) var isLoading = false
    @Published private(set) var error: IPInfoError?
    @Published var isError = false
    @Published private(set) var currentIP: String = ""
    
    // MARK: Private properties
    private let networkService: NetworkServiceProtocol
    
    // MARK: Initialization
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
}

// MARK: - Public Methods
extension IPInfoViewModel {
    @MainActor
    func fetchIPInfo(for ip: String) async {
        await performNetworkRequest {
            try await self.networkService.fetchIPInfo(for: ip)
        }
    }
    
    @MainActor
    func fetchUserIPAndInfo() async {
        await performNetworkRequest {
            let response = try await self.networkService.fetchUserIP()
            self.currentIP = response.ip
            return try await self.networkService.fetchIPInfo(for: response.ip)
        }
    }
    
    func reset() {
        ipInfo = nil
        error = nil
        isError = false
        currentIP = ""
    }
}

// MARK: - Private Methods
private extension IPInfoViewModel {
    @MainActor
    func performNetworkRequest(_ request: @escaping () async throws -> IPInfo) async {
        isLoading = true
        error = nil
        isError = false
        
        do {
            ipInfo = try await request()
        } catch {
            handleError(error)
        }
        
        isLoading = false
    }
    
    func handleError(_ error: Error) {
        if let networkError = error as? NetworkError {
            self.error = networkError.asIPInfoError
        } else {
            self.error = .unknownError(error.localizedDescription)
        }
        isError = true
    }
}
