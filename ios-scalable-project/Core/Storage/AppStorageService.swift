//
//  AppStorageService.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 22/05/25.
//

import Foundation

final class AppStorageService: AppStorageProtocol {
    private let defaults = UserDefaults.standard

    func set<T: Codable>(_ value: T, forKey key: String) {
        if let data = try? JSONEncoder().encode(value) {
            defaults.set(data, forKey: key)
        }
    }

    func get<T: Codable>(forKey key: String) -> T? {
        guard let data = defaults.data(forKey: key),
              let object = try? JSONDecoder().decode(T.self, from: data) else {
            return nil
        }
        return object
    }

    func remove(forKey key: String) {
        defaults.removeObject(forKey: key)
    }
}
