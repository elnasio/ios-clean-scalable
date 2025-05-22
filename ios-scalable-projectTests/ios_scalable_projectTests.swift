//
//  ios_scalable_projectTests.swift
//  ios-scalable-projectTests
//
//  Created by Mories Hutapea on 22/05/25.
//

import XCTest
@testable import ios_scalable_project
import Factory

final class ios_scalable_projectTests: XCTestCase {

    override func setUp() {
        AppContainer.shared.reset()

        AppContainer.shared.apiService.register {
            MockAPIService()
        }

        AppContainer.shared.sysParamService.register {
            MockSysParamService()
        }
    }

    override func tearDown() {
        AppContainer.shared.reset()
    }

    func testExample() {
        let api = AppContainer.shared.apiService()
        XCTAssertNotNil(api)
    }
}
