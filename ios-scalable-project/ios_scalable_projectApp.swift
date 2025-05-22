//
//  ios_scalable_projectApp.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 22/05/25.
//

import SwiftUI

@main
struct ios_scalable_projectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
