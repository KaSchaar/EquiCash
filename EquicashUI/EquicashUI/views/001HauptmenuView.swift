//
//  HauptmenuView.swift
//  EquicashUI
//
//  Created by katy schaarschmidt on 30.10.24.
//
import SwiftUI

struct HauptmenuView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                // Titel zentriert über dem Button
                Text("EquiCash")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(Color(hex: "296372")) // Verwendet Hex-Farbe über die erweiterte Funktion

                // NavigationLink mit dem Button, der zur MemberCheckView führt
                NavigationLink(destination: MemberCheckView()) {
                    ZStack {
                        // Hintergrund des Buttons
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(hex: "E3E0D8")) // Hintergrundfarbe des Buttons
                            .frame(width: 200, height: 200) // Button-Größe
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)

                        // Logo zentriert im Button, mit Fehlerbehandlung falls das Bild fehlt
                        if let logoImage = UIImage(named: "logo") {
                            Image(uiImage: logoImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150) // Logo etwas kleiner als der Button
                        } else {
                            Text("Logo fehlt") // Fallback-Text, falls das Bild nicht geladen werden kann
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Bildschirmfüllend
            .background(Color(hex: "E3E0D8")) // Hintergrundfarbe
            .ignoresSafeArea() // Hintergrund über gesamte Bildschirmfläche
            .toolbar(.hidden, for: .navigationBar) // Entfernt die Toolbar, SwiftUI 5-konform
        }
    }
}

