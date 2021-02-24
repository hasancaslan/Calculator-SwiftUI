//
//  SetPasscodeState.swift
//  Photo Vault
//
//  Created by HASAN CAN on 10/8/20.
//  Copyright © 2020 pbstudio. All rights reserved.
//

import Foundation

struct SetPasscodeState: PasscodeLockStateType {
    let title: String
    let description: String
    let isCancellableAction = false
    var isTouchIDAllowed = false

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }

    init() {
        title = L10n.PasscodeLock.Set.title
        description = L10n.PasscodeLock.Set.description
    }

    func accept(passcode: String, from lock: PasscodeLockType) {
        lock.changeState(ConfirmPasscodeState(passcode: passcode))
    }
}
