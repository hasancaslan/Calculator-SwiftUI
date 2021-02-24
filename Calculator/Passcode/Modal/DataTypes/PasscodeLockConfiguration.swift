//
//  PasscodeLockConfiguration.swift
//  Photo Vault
//
//  Created by HASAN CAN on 10/8/20.
//  Copyright © 2020 pbstudio. All rights reserved.
//

import Foundation

struct PasscodeLockConfiguration: PasscodeLockConfigurationType {
    let repository: PasscodeRepositoryType
    let passcodeLength = 4
    var isTouchIDAllowed = true
    let shouldRequestTouchIDImmediately = true
    let maximumIncorrectPasscodeAttempts = 3

    init(repository: PasscodeRepositoryType) {
        self.repository = repository
    }

    init() {
        self.repository = UserDefaultsPasscodeRepository()
    }
}
