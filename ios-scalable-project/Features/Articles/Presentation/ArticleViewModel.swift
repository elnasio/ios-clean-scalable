//
//  ArticleViewModel.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 23/05/25.
//

import Foundation
import Combine

@MainActor
final class ArticleViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let interactor: ArticleInteractorProtocol
    private var cancellables = Set<AnyCancellable>()

    init(interactor: ArticleInteractorProtocol = AppContainer.shared.articleInteractor()) {
        self.interactor = interactor
    }

    func fetchArticles() {
        isLoading = true
        errorMessage = nil

        interactor.fetchArticles()
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] articles in
                self?.articles = articles
            }
            .store(in: &cancellables)
    }
}
