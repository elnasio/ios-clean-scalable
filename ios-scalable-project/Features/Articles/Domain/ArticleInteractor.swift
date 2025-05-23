//
//  ArticleInteractor.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 23/05/25.
//

import Foundation
import Combine

protocol ArticleInteractorProtocol {
    func fetchArticles() -> AnyPublisher<[Article], Error>
}

final class ArticleInteractor: ArticleInteractorProtocol {
    private let apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol = DIResolver.apiService) {
        self.apiService = apiService
    }

    func fetchArticles() -> AnyPublisher<[Article], Error> {
        apiService.request(Endpoint.getArticles, responseType: ArticleResponse.self)
            .map(\.results)
            .eraseToAnyPublisher()
    }
}
