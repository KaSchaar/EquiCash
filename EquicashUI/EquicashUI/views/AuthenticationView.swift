//
//  AuthenticationView.swift
//  EquicashUI
//

//  Created by katy schaarschmidt on 31.10.24.
//import SwiftUI
import SwiftUI

struct AuthenticationView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack {
            TextField("E-Mail", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Passwort", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Anmelden") {
                authenticationViewModel.signIn(email: email, password: password)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
            .environmentObject(AuthenticationViewModel()) // Add preview environment object
    }
}
