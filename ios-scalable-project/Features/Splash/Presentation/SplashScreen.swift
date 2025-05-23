//
//  SplashScreen.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 23/05/25.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var isLoggedIn = false

    var body: some View {
        if isActive {
            if isLoggedIn {
                AnyView(MainTabView())
            } else {
                AnyView(LoginScreen())
            }
        } else {
            AnyView(
                VStack(spacing: 16) {
                    Image(systemName: "swift")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.orange)

                    Text("ios-scalable-project")
                        .font(.title2)
                        .bold()
                        .padding(.top, 8)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .ignoresSafeArea()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        let token: String? = DIResolver.appStorage.get(forKey: "access_token")
                        isLoggedIn = token != nil
                        isActive = true
                    }
                }
            )
        }
    }
}
