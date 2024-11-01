//
//  RegistrationView.swift
//  EquicashUI
//
//  Created by katy schaarschmidt on 30.10.24.
//import SwiftUI
import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

struct RegistrationView: View {
    @State private var name = ""
    @State private var phoneNumber = ""
    @State private var email = ""
    @State private var password = ""
    @State private var passwordConfirmation = ""
    @State private var agreeToTerms = false
    @State private var errorMessage = ""
    @State private var isRegistering = false
    @State private var showSuccessMessage = false
    @State private var navigateToLogin = false

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Persönliche Daten")) {
                    TextField("Name", text: $name)
                    TextField("Telefonnummer", text: $phoneNumber)
                }

                Section(header: Text("Anmeldedaten")) {
                    TextField("E-Mail", text: $email)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)

                    SecureField("Passwort", text: $password)
                    SecureField("Passwort wiederholen", text: $passwordConfirmation)
                }

                Section {
                    Toggle("AGB akzeptieren", isOn: $agreeToTerms)
                    Button("Registrieren") {
                        registerUser()
                    }
                    .disabled(!agreeToTerms || isRegistering)
                }
            }
            .alert(isPresented: $showSuccessMessage) {
                Alert(
                    title: Text("Registrierung erfolgreich!"),
                    message: Text("Sie werden jetzt zur Anmeldung weitergeleitet."),
                    dismissButton: .default(Text("OK")) {
                        navigateToLogin = true
                    }
                )
            }
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView()
            }
            .alert(isPresented: .constant(!errorMessage.isEmpty)) {
                Alert(title: Text("Fehler"), message: Text(errorMessage), dismissButton: .default(Text("OK"), action: {
                    errorMessage = ""
                }))
            }
        }
    }

    private func registerUser() {
        // Eingaben validieren
        guard password == passwordConfirmation else {
            errorMessage = "Passwörter stimmen nicht überein."
            return
        }
        
        guard !name.isEmpty, !phoneNumber.isEmpty, !email.isEmpty, !password.isEmpty else {
            errorMessage = "Bitte füllen Sie alle Felder aus."
            return
        }
        
        isRegistering = true
        
        // Firebase Auth - Benutzer erstellen
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            isRegistering = false
            
            if let error = error {
                self.errorMessage = "Fehler bei der Registrierung: \(error.localizedDescription)"
                return
            }
            
            guard let user = authResult?.user else {
                self.errorMessage = "Konto konnte nicht erstellt werden."
                return
            }
            
            // Benutzerdaten in Firestore speichern
            let db = Firestore.firestore()
            db.collection("users").document(user.uid).setData([
                "name": name,
                "phoneNumber": phoneNumber,
                "email": email
            ]) { error in
                if let error = error {
                    self.errorMessage = "Fehler beim Speichern der Benutzerdaten: \(error.localizedDescription)"
                } else {
                    // Erfolgreiche Registrierung, Bestätigungsnachricht anzeigen
                    self.showSuccessMessage = true
                }
            }
        }
    }
}
