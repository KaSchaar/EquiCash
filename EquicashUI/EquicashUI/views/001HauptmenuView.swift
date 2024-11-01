//
//  HauptmenuView.swift
//  EquicashUI
//
//  Created by katy schaarschmidt on 30.10.24.
//
import SwiftUI

struct HauptmenuView: View {
    @State private var isPulsing = false // State für die Animation

    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                Spacer()

                Text("EquiCash")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(Color(hex: "296372"))

                // Logo-Button mit Navigation zur MemberCheckView
                NavigationLink(destination: MemberCheckView()) {
                    ZStack {
                        // Hintergrund des Buttons
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(hex: "E3E0D8")) // Button-Hintergrundfarbe
                            .frame(width: 150, height: 150)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)
                            .scaleEffect(isPulsing ? 1.05 : 1.0) // Leichte Skalierung
                            .animation(
                                Animation.easeInOut(duration: 1)
                                    .repeatForever(autoreverses: true),
                                value: isPulsing
                            )

                        // Logo-Bild in kleinerer Größe
                        Image("logo") // Verweis auf das Logo in den Assets
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120) // Logo etwas kleiner
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .onAppear {
                    isPulsing = true // Startet die Animation beim Anzeigen der View
                }

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Füllt den gesamten Bildschirm
            .background(Color(hex: "E3E0D8")) // Hintergrundfarbe anwenden
            .ignoresSafeArea() // Hintergrund über gesamte Bildschirmfläche
        }
    }
}
