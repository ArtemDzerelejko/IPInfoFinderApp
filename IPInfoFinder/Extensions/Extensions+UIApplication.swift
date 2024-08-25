//
//  Extensions+UIApplication.swift
//  IPInfoFinder
//
//  Created by artem on 25.08.2024.
//

import SwiftUI

extension UIApplication {
    func hideKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
