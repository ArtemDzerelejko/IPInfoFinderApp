//
//  InfoRow.swift
//  IPInfoFinder
//
//  Created by artem on 25.08.2024.
//

import SwiftUI

struct InfoRow: View {
    // MARK: Properties
    let title: String
    let value: String
    var valueColor: Color = AppColors.basicsDark
    var isValueButton: Bool = false
    var onValueTap: (() -> Void)?
    var destination: (() -> AnyView)?
    
    // MARK: Body
    var body: some View {
        HStack(alignment: .top) {
            titleText
            contentView
            Spacer()
        }
    }
}

// MARK: - InfoRow Components
private extension InfoRow {
    var titleText: some View {
        Text(title)
            .font(AppFont.bodyThree)
            .foregroundColor(AppColors.basicsDark)
            .frame(width: 95, alignment: .leading)
    }
    
    @ViewBuilder
    var contentView: some View {
        if let destination = destination {
            NavigationLink(destination: destination()) {
                valueText
            }
        } else if isValueButton {
            Button(action: { onValueTap?() }) {
                valueText
            }
            .buttonStyle(PlainButtonStyle())
        } else {
            valueText
        }
    }
    
    var valueText: some View {
        Text(value)
            .font(AppFont.bodyThree)
            .foregroundColor(valueColor)
            .underline(isValueButton)
    }
}
