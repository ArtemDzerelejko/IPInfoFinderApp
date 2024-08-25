//
//  ContentView.swift
//  IPInfoFinder
//
//  Created by artem on 21.08.2024.
//

import SwiftUI

struct IPDetailsView: View {
    // MARK: - Properties
    @StateObject private var viewModel = IPInfoViewModel()
    @State private var ipInput = ""
    @State private var showInvalidIPAlert = false
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    inputSection
                    buttonSection
                    contentSection
                    Spacer()
                }
                .padding(.top, 24)
                .padding(.horizontal, 16)
                
                if showInvalidIPAlert {
                    CustomAlertView(isPresented: $showInvalidIPAlert, onOk: {})
                }
            }
        }
        .alert(isPresented: $viewModel.isError, content: errorAlert)
    }
    
    // MARK: - View Components
    private var inputSection: some View {
        CustomTextField(text: $ipInput, placeholder: Constants.ipAddressPlaceholder)
            .padding(.bottom, 12)
    }
    
    private var buttonSection: some View {
        VStack(alignment: .center, spacing: 8) {
            CustomButton(text: Constants.getInfoText, textColor: .white, backgroundColor: .blue, action: getInfoAction)
            CustomButton(text: Constants.findMeText, textColor: .blueMain, backgroundColor: Color(.blueMedium), action: findMeAction)
            CustomButton(text: Constants.resetText, textColor: .redMedium, backgroundColor: .redLight, action: resetAction)
        }
        .padding(.bottom, 12)
    }
    
    @ViewBuilder
    private var contentSection: some View {
        if viewModel.isLoading {
            ProgressView()
        } else if let error = viewModel.error {
            CustomErrorView(message: error.message, retryAction: retryAction)
        } else if let ipInfo = viewModel.ipInfo {
            IPInfoView(ipInfo: ipInfo)
        }
    }
    
    private func errorAlert() -> Alert {
        Alert(
            title: Text("Error"),
            message: Text(viewModel.error?.message ?? "An unknown error occurred"),
            dismissButton: .default(Text("OK"))
        )
    }
}

// MARK: - Actions
private extension IPDetailsView {
    func getInfoAction() {
        UIApplication.shared.hideKeyboard()
        if IPValidator.isValid(ipInput) {
            Task {
                await viewModel.fetchIPInfo(for: ipInput)
            }
        } else {
            showInvalidIPAlert = true
        }
    }
    
    func findMeAction() {
        UIApplication.shared.hideKeyboard()
        Task {
            await viewModel.fetchUserIPAndInfo()
            ipInput = viewModel.currentIP
        }
    }
    
    func resetAction() {
        UIApplication.shared.hideKeyboard()
        viewModel.reset()
        ipInput = ""
    }
    
    func retryAction() {
        Task {
            if !ipInput.isEmpty {
                await viewModel.fetchIPInfo(for: ipInput)
            } else {
                await viewModel.fetchUserIPAndInfo()
            }
        }
    }
}
