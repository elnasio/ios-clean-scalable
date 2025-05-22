//
//  SysParamService.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 22/05/25.
//

import Foundation
import CryptoKit
import UIKit

protocol SysParamServiceProtocol {
    func generateSignature() -> String
    func getRawPayload() -> [String: String]
}

final class SysParamService: SysParamServiceProtocol {
    
    private let secret = "YOUR_SECRET_KEY" // Ganti dengan shared secret aman (sama dengan backend)
    
    func getRawPayload() -> [String: String] {
        let deviceId = UIDevice.current.identifierForVendor?.uuidString ?? "unknown"
        let os = "iOS"
        let version = UIDevice.current.systemVersion
        let bundle = Bundle.main.bundleIdentifier ?? "unknown"
        let timestamp = String(Int(Date().timeIntervalSince1970))
        
        return [
            "device_id": deviceId,
            "os": os,
            "version": version,
            "bundle": bundle,
            "timestamp": timestamp
        ]
    }
    
    func generateSignature() -> String {
        let payload = getRawPayload()
        let rawString = "\(payload["device_id"] ?? ""):\(payload["bundle"] ?? ""):\(payload["timestamp"] ?? ""):\(secret)"
        let digest = SHA256.hash(data: Data(rawString.utf8))
        return digest.compactMap { String(format: "%02x", $0) }.joined()
    }
}
