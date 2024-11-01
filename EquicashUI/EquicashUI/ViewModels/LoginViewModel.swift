//
//  LoginViewModel.swift
//  EquicashUI
//
//  Created by katy schaarschmidt on 01.11.24.
//
import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    // Beispiel für eine Login-Funktion
    func login() {
        // Implementiere hier die Login-Logik
    }
}
