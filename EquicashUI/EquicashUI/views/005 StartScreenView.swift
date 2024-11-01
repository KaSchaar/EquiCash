//
//   StartScreenView.swift
//  EquicashUI
//
//  Created by katy schaarschmidt on 30.10.24.
//

import SwiftUI

struct StartScreenView: View {
    @State private var selectedTab: Tab = .home // State für ausgewählten Tab
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // Logo und Titel, zentriert
                VStack(spacing: 20) {
                    Text("EquiCash")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(Color(hex: "296372"))
                    
                    ZStack {
                        // Hintergrund des Logos
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(hex: "E3E0D8"))
                            .frame(width: 150, height: 150)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)
                        
                        // Logo-Bild
                        Image("logo") // Verweis auf das Logo in den Assets
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    }
                }
                
                Spacer()
                
                
            }}}}
