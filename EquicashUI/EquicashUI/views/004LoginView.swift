//
//  LoginView.swift
//  EquicashUI
//
//  Created by katy schaarschmidt on 30.10.24.
//
// Views/LoginView.swift
import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isLoggingIn = false
    @State private var isLoginSuccessful = false

    var body: some View {
        VStack {
            TextField("E-Mail", text: $email)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)

            SecureField("Passwort", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)

            Button("Einloggen") {
                loginUser()
            }
            .disabled(isLoggingIn)
            .padding()

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
        .alert(isPresented: $isLoginSuccessful) {
            Alert(
                title: Text("Erfolgreich eingeloggt"),
                message: Text("Sie haben sich erfolgreich eingeloggt."),
                dismissButton: .default(Text("OK"))
            )
        }
    }

    private func loginUser() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Bitte E-Mail und Passwort eingeben."
            return
        }

        isLoggingIn = true

        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            isLoggingIn = false

            if let error = error {
                self.errorMessage = "Fehler beim Einloggen: \(error.localizedDescription)"
                return
            }

            if authResult?.user != nil {
                self.isLoginSuccessful = true
                self.errorMessage = ""
            } else {
                self.errorMessage = "Einloggen fehlgeschlagen."
            }
        }
    }
}
