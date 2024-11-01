//
//  Treatment..swift
//  EquicashUI
//
//  Created by katy schaarschmidt on 30.10.24.
//
import SwiftUI

struct Treatment: Identifiable, Codable {
    var id: String?
    let name: String
    let imageName: String
    let backgroundColor: String // Store as hex code for color
}
