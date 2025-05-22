//
//  MockAPIService.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 22/05/25.
//

import Foundation
import Combine
@testable import ios_scalable_project

final class MockAPIService: APIServiceProtocol {
    func request<T>(_ endpoint: Endpoint) -> AnyPublisher<T, Error> where T : Decodable {
        // Simulasikan data kosong atau dummy response
        let dummy = "{}".data(using: .utf8)!
        return Just(dummy)
            .tryMap { data in
                try JSONDecoder().decode(T.self, from: data)
            }
            .eraseToAnyPublisher()
    }
}
