//
//  CustomButton.swift
//  IPInfoFinder
//
//  Created by artem on 25.08.2024.
//

import SwiftUI

struct CustomButton: View {
    // MARK: - Properties
    let text: String
    let textColor: Color
    let backgroundColor: Color
    let action: () -> Void
    
    var font: Font = AppFont.headlineThree
    var height: CGFloat = 44
    var cornerRadius: CGFloat = 10
    
    // MARK: - Body
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(font)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .cornerRadius(cornerRadius)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
