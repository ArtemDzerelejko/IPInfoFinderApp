//
//  CustomAlertView.swift
//  IPInfoFinder
//
//  Created by artem on 25.08.2024.
//

import SwiftUI

struct CustomAlertView: View {
    // MARK: Properties
    @Binding var isPresented: Bool
    var onOk: () -> Void
    
    // MARK: Constants
    private enum Constants {
        static let backgroundOpacity: Double = 0.3
        static let alertWidth: CGFloat = 270
        static let alertHeight: CGFloat = 138
        static let cornerRadius: CGFloat = 14
        static let verticalOffset: CGFloat = 337 + 69
    }
    
    // MARK: Body
    var body: some View {
        ZStack {
            backgroundOverlay
            alertContent
        }
    }
}

// MARK: - CustomAlertView Components
private extension CustomAlertView {
    var backgroundOverlay: some View {
        Color.black.opacity(Constants.backgroundOpacity)
            .edgesIgnoringSafeArea(.all)
    }
    
    var alertContent: some View {
        VStack(spacing: 2) {
            messageContent
            Divider()
            buttonSection
        }
        .frame(width: Constants.alertWidth, height: Constants.alertHeight)
        .background(Color.white)
        .cornerRadius(Constants.cornerRadius)
        .position(x: UIScreen.main.bounds.width / 2, y: Constants.verticalOffset)
    }
    
    var messageContent: some View {
        VStack(spacing: 2) {
            Text("Alert error")
                .font(AppFont.headlineThree)
            
            Text("Wrong IP!")
                .font(AppFont.captionTwo)
            
            Text("Please provide a valid IP address")
                .font(AppFont.captionTwo)
                .multilineTextAlignment(.center)
        }
        .padding(.top, 19)
        .padding(.bottom, 10)
    }
    
    var buttonSection: some View {
        HStack(spacing: 0) {
            alertButton(text: "Cancel") { isPresented = false }
            Divider()
            alertButton(text: "Ok") {
                onOk()
                isPresented = false
            }
        }
    }
    
    func alertButton(text: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(text)
                .font(AppFont.headlineThree)
                .foregroundColor(AppColors.blueMain)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
        }
    }
}
