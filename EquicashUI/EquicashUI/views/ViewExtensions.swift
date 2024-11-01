//
//  ViewExtensions.swift
//  EquicashUI
//
//  Created by katy schaarschmidt on 30.10.24.
import SwiftUI

// Erweiterung für das TextField Styling
extension View {
    func customTextFieldStyle() -> some View {
        self
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color(hex: "D4A776").opacity(0.2), radius: 5, x: 0, y: 3)
            .padding(.horizontal, 20)
            .font(.system(size: 16))
    }
}
