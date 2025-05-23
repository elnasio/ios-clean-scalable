//
//  ProfileScreen.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 23/05/25.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("This is your profile")
                    .font(.title2)
                    .padding()
            }
            .navigationTitle("Profile")
        }
    }
}
