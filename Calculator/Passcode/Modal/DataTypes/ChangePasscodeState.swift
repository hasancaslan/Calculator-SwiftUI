//
//  ChangePasscodeState.swift
//  Photo Vault
//
//  Created by HASAN CAN on 10/8/20.
//  Copyright © 2020 pbstudio. All rights reserved.
//

import Foundation

struct ChangePasscodeState: PasscodeLockStateType {
    let title: String
    let description: String
    let isCancellableAction = true
    var isTouchIDAllowed = false

    init() {
        title = L10n.PasscodeLock.Change.title
        description = L10n.PasscodeLock.Change.description
    }

    func accept(passcode: String, from lock: PasscodeLockType) {
        if lock.repository.check(passcode: passcode) {
            lock.changeState(SetPasscodeState())
        } else {
            lock.delegate?.passcodeLockDidFail(lock)
        }
    }
}
