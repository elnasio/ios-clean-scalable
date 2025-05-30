//
//  MockAPIService.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 22/05/25.
//

import Foundation
import Combine

final class MockAPIService: APIServiceProtocol {
    func request<T>(_ endpoint: Endpoint, responseType: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        // Dummy JSON untuk tipe yang diharapkan
        let dummyJSON = """
        {
            "count": 1,
            "results": [
                {
                    "id": 1,
                    "title": "Test Article",
                    "url": "https://example.com",
                    "publishedAt": "2025-01-01T00:00:00Z"
                }
            ]
        }
        """

        let data = Data(dummyJSON.utf8)

        return Just(data)
            .tryMap { data in
                try JSONDecoder().decode(T.self, from: data)
            }
            .eraseToAnyPublisher()
    }
}
