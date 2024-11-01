//
//  AuthenticationViewModel.swift
//  EquicashUI
//
//  Created by katy schaarschmidt on 31.10.24.
import SwiftUI
import FirebaseAuth

class AuthenticationViewModel: ObservableObject {
    @Published var emailError: String?
    @Published var passwordError: String?
    @Published var passwordConfirmationError: String?
    @Published var showDomainError = false
    @Published var isAuthenticated = false
    
    func signIn(email: String, password: String) {
        clearErrors()
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
            if let error = error {
                self?.emailError = "Fehler bei der Anmeldung: \(error.localizedDescription)"
                self?.showDomainError = true
            } else {
                self?.isAuthenticated = true
            }
        }
    }
    
    func register(email: String, password: String, passwordConfirmation: String, name: String, phoneNumber: String) {
        clearErrors()
        
        guard password == passwordConfirmation else {
            self.passwordConfirmationError = "Passwörter stimmen nicht überein"
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] _, error in
            if let error = error {
                self?.emailError = "Fehler bei der Registrierung: \(error.localizedDescription)"
            } else {
                self?.isAuthenticated = true
                // Optionally, add user details to Firestore here
            }
        }
    }
    
    private func clearErrors() {
        emailError = nil
        passwordError = nil
        passwordConfirmationError = nil
        showDomainError = false
    }
}
