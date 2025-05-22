//
//  Container.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 22/05/25.
//

// Tambahkan module jika sudah tersedia
// import CoreNetwork
// import CoreSecurity
// import CoreStorage

import Factory

extension AppContainer {
    var apiService: Factory<APIServiceProtocol> {
        Factory(Self.shared) {
            APIService(
                baseURL: EnvironmentConfig.baseURL,
                sslSession: Self.shared.sslSession()
            )
        }
    }

    var sysParamService: Factory<SysParamServiceProtocol> {
        Factory(Self.shared) {
            SysParamService()
        }
    }

    var sslSession: Factory<SSLPinningSession> {
        Factory(Self.shared) {
            SSLPinningSession(isPinningEnabled: EnvironmentConfig.enableSSLPinning)
        }
    }

    var appStorage: Factory<AppStorageProtocol> {
        Factory(Self.shared) { AppStorageService() }
    }

    var secureStorage: Factory<SecureStorageProtocol> {
        Factory(Self.shared) { SecureStorageService() }
    }

    var localDatabase: Factory<LocalDatabaseProtocol> {
        Factory(Self.shared) { CoreDataLocalDatabase() }
    }
}
