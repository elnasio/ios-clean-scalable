//
//  AppContainer.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 22/05/25.
//

import Factory

final class AppContainer: SharedContainer {
    static let shared = AppContainer()
    
    let manager = ContainerManager()
}
