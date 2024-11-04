
// Views/MemberCheckView.swift
// MemberCheckView.swift
// Created by katy schaarschmidt on 30.10.24.


import SwiftUI

struct MemberCheckView: View {
    // Zwei separate @State-Variablen für die Navigation
    @State private var isLoginActive = false
    @State private var isRegisterActive = false

    var body: some View {
        NavigationLink(destination: Text("")) {
            VStack(spacing: 40) {
                Spacer()

                Text("Besitzt du bereits ein Kundenkonto bei EquiCash?")
                    .font(.system(size: 18, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(hex: "296372"))

                Spacer()

                // Button für "Ja" -> Navigation zu LoginView
                Button(action: {
                    isLoginActive = true
                }) {
                    Text("Ja")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "D4A776"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 40)
                
                // Button für "Nein" -> Navigation zu RegistrationView
                Button(action: {
                    isRegisterActive = true
                }) {
                    Text("Nein")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(Color(hex: "296372"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hex: "296372"), lineWidth: 2)
                        )
                }
                .padding(.horizontal, 40)

                Spacer()
            }
            .background(Color(hex: "E3E0D8"))
            .edgesIgnoringSafeArea(.all)
            // NavigationDestination für LoginView und RegistrationView
            .navigationDestination(isPresented: $isLoginActive) {
                LoginView()
            }
            .navigationDestination(isPresented: $isRegisterActive) {
                RegistrationView()
            }
        }
    }
}
