//
//  MockSysParamService.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 22/05/25.
//

import Foundation

final class MockSysParamService: SysParamServiceProtocol {
    func generateSignature() -> String {
        return "mock-signature"
    }

    func getRawPayload() -> [String : String] {
        return ["device_id": "mock-device"]
    }
}
