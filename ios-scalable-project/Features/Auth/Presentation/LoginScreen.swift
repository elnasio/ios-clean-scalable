//
//  LoginScreen.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 23/05/25.
//

import SwiftUI

struct LoginScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false

    var body: some View {
        NavigationStack {
            if isLoggedIn {
                MainTabView()
            } else {
                VStack(spacing: 20) {
                    Text("Welcome Back")
                        .font(.title)
                        .bold()

                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)

                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)

                    Button("Login") {
                        // Simulasi login berhasil
                        isLoggedIn = true
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    NavigationLink("Don't have an account? Register") {
                        RegisterScreen()
                    }
                    .font(.footnote)
                    .padding(.top, 8)
                }
                .padding()
            }
        }
    }
}
