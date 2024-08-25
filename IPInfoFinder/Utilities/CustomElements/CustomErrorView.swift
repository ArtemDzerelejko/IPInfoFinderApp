//
//  ErrorView.swift
//  IPInfoFinder
//
//  Created by artem on 25.08.2024.
//

import Foundation
import SwiftUI

struct CustomErrorView: View {
    // MARK: - Properties
    let message: String
    let retryAction: () -> Void
    
    // MARK: - Body
    var body: some View {
        VStack {
            Text(message)
                .foregroundColor(AppColors.redMain)
                .multilineTextAlignment(.center)
                .padding()
            
            Button("Retry") {
                retryAction()
            }
        }
    }
}
