//
//  SecureStorageProtocol.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 22/05/25.
//

protocol SecureStorageProtocol {
    func set(_ value: String, forKey key: String)
    func get(forKey key: String) -> String?
    func remove(forKey key: String)
}
