//
//  APIServiceProtocol.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 22/05/25.
//

import Combine
import Foundation

protocol APIServiceProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint, responseType: T.Type) -> AnyPublisher<T, Error>
}
