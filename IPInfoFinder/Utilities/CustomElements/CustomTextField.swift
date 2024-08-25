//
//  CustomTextField.swift
//  IPInfoFinder
//
//  Created by artem on 25.08.2024.
//

import SwiftUI

struct CustomTextField: View {
    // MARK: - Properties
    @Binding var text: String
    let placeholder: String
    @State private var isValid: Bool = true
    @FocusState private var isInputActive: Bool
    
    var placeholderFont: Font = AppFont.bodyThree
    var textFont: Font = AppFont.bodyTwo
    var textColor: Color = .basicsDark
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 4) {
            if text.isEmpty {
                Image(Constants.magnifyingglassForTextField)
                    .foregroundColor(AppColors.greyBlue)
            }
            
            ZStack(alignment: .leading) {
                if text.isEmpty && !isInputActive {
                    Text(placeholder)
                        .foregroundColor(AppColors.greyDark)
                        .font(placeholderFont)
                }
                TextField("", text: $text, onEditingChanged: { isEditing in
                    isInputActive = isEditing
                })
                .font(textFont)
                .foregroundColor(textColor)
                .focused($isInputActive)
                .onChange(of: text) { newValue in
                    validateAndFormatInput(newValue)
                }
            }
            
            if !text.isEmpty {
                Button(action: {
                    text = ""
                    isValid = true
                }) {
                    Image(Constants.xmarkForTextField)
                }
            }
        }
        .padding(16)
        .frame(height: 44)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(borderColor, lineWidth: 1)
        )
        .cornerRadius(10)
        .onTapGesture {
            isInputActive = false
            hideKeyboard()
        }
    }
    
    // MARK: - Private Methods
    private func validateAndFormatInput(_ input: String) {
        text = IPValidator.formatInput(input)
        isValid = IPValidator.isValid(text)
    }
    
    private var borderColor: Color {
        if text.isEmpty {
            return AppColors.greyBlue
        } else if isValid {
            return AppColors.blueMain
        } else {
            return AppColors.redMain
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
