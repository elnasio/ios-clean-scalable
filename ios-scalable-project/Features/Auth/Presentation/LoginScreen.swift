//
//  LoginScreen.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 23/05/25.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        NavigationStack {
            if viewModel.isSuccess {
                MainTabView()
            } else {
                VStack(spacing: 20) {
                    Text("Welcome Back")
                        .font(.title)
                        .bold()

                    TextField("Email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)

                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)

                    if let error = viewModel.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.footnote)
                    }

                    Button(action: {
                        viewModel.login()
                    }) {
                        if viewModel.isLoading {
                            ProgressView()
                        } else {
                            Text("Login")
                                .frame(maxWidth: .infinity)
                        }
                    }
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
