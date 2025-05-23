//
//  LoginInteractor.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 23/05/25.
//

import Foundation
import Combine

protocol LoginInteractorProtocol {
    func login(email: String, password: String) -> AnyPublisher<Bool, Error>
}

final class LoginInteractor: LoginInteractorProtocol {
    private let appStorage: AppStorageProtocol

    init(appStorage: AppStorageProtocol = DIResolver.appStorage) {
        self.appStorage = appStorage
    }

    func login(email: String, password: String) -> AnyPublisher<Bool, Error> {
        // Simulasi login API call dan response token
        return Just("mock_token_123456")
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .tryMap { token in
                self.appStorage.set(token, forKey: "access_token")
                return true
            }
            .eraseToAnyPublisher()
    }
}
