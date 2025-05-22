//
//  APIService.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 22/05/25.
//

import Foundation
import Combine

final class APIService: APIServiceProtocol {
    private let baseURL: String
    private let sslSession: SSLPinningSession

    init(baseURL: String, sslSession: SSLPinningSession = DIResolver.sslSession) {
        self.baseURL = baseURL
        self.sslSession = sslSession
    }

    func request<T: Decodable>(_ endpoint: Endpoint) -> AnyPublisher<T, Error> {
        guard let url = URL(string: baseURL + endpoint.path) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers

        return Future<Data, Error> { promise in
            self.sslSession.performRequest(request) { result in
                promise(result)
            }
        }
        .decode(type: T.self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
