//
//  RegistrationViewModel.swift
//  EquicashUI
//
//  Created by katy schaarschmidt on 30.10.24.
import SwiftUI
import Combine

class RegistrationViewModel: ObservableObject {
    // Eingabefelder
    @Published var email = ""
    @Published var emailRepeat = ""
    @Published var password = ""
    @Published var passwordRepeat = ""
    @Published var agreeToTerms = false
    
    // Validierung und Registrierungsmethoden
    var isFormValid: Bool {
        !email.isEmpty && !password.isEmpty && email == emailRepeat && password == passwordRepeat && agreeToTerms
    }
    
    func register() {
        // Registrierungscode hier
        print("Registrierung gestartet mit E-Mail: \(email)")
    }
}
