//
//  EnvironmentConfig.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 22/05/25.
//

import Foundation

enum AppEnvironment: String {
    case development, staging, production
}

struct EnvironmentConfig {
    static let current: AppEnvironment = {
#if DEBUG
        return .development
#elseif STAGING
        return .staging
#else
        return .production
#endif
    }()
    
    static var baseURL: String {
        if let url = configValue(forKey: "BaseURL") {
            return url
        }
        return "https://fallback.yourapp.com" // fallback
    }
    
    static var enableSSLPinning: Bool {
        switch current {
        case .production: return true
        default: return false
        }
    }
    
    private static func configValue(forKey key: String) -> String? {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path),
              let value = dict[key] as? String else {
            return nil
        }
        return value
    }
}
