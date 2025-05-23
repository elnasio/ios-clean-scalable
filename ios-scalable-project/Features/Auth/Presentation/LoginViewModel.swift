//
//  LoginViewModel.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 23/05/25.
//

import Foundation
import Combine

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var isSuccess = false
    @Published var errorMessage: String?
    
    private let loginInteractor: LoginInteractorProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(loginInteractor: LoginInteractorProtocol = AppContainer.shared.loginInteractor()) {
        self.loginInteractor = loginInteractor
    }
    
    func login() {
        if let validationError = validateInputs() {
            self.errorMessage = validationError
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        loginInteractor.login(email: email, password: password)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] success in
                self?.isSuccess = success
            }
            .store(in: &cancellables)
    }
    
    func validateInputs() -> String? {
        if email.isEmpty {
            return "Email cannot be empty"
        }
        if !email.contains("@") || !email.contains(".") {
            return "Invalid email format"
        }
        if password.isEmpty {
            return "Password cannot be empty"
        }
        return nil
    }
    
}
