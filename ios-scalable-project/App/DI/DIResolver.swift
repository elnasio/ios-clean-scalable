//
//  DIResolver.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 22/05/25.
//

import Factory

enum DIResolver {
    static var apiService: APIServiceProtocol {
        AppContainer.shared.apiService()
    }

    static var sysParamService: SysParamServiceProtocol {
        AppContainer.shared.sysParamService()
    }

    static var sslSession: SSLPinningSession {
        AppContainer.shared.sslSession()
    }
}
