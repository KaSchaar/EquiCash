//
//  CustomCheckboxToggleStyle.swift
//  EquicashUI
//
//  Created by katy schaarschmidt on 30.10.24.
//ist die Datenschutzzustimmung

import SwiftUI

struct CustomCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .foregroundColor(configuration.isOn ? Color(hex: "D4A776") : Color.gray)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
        }
    }
}
