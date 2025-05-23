//
//  HomeScreen.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 23/05/25.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Home")
                    .font(.title)
                    .padding()
            }
            .navigationTitle("Home")
        }
    }
}
