//
//  DIOverride.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 22/05/25.
//

import Factory

func configureTestDependencies() {
    AppContainer.shared.reset()
    
    AppContainer.shared.apiService.register {
        MockAPIService()
    }
    
    AppContainer.shared.sysParamService.register {
        MockSysParamService()
    }
}
