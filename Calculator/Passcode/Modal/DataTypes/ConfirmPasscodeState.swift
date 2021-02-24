//
//  ConfirmPasscodeState.swift
//  Photo Vault
//
//  Created by HASAN CAN on 10/8/20.
//  Copyright © 2020 pbstudio. All rights reserved.
//

import Foundation

struct ConfirmPasscodeState: PasscodeLockStateType {
    let title: String
    let description: String
    let isCancellableAction = true
    var isTouchIDAllowed = false

    private var passcodeToConfirm: String

    init(passcode: String) {
        passcodeToConfirm = passcode
        title = L10n.PasscodeLock.Confirm.title
        description = L10n.PasscodeLock.Confirm.description
    }

    func accept(passcode: String, from lock: PasscodeLockType) {
        if passcode == passcodeToConfirm {
            lock.repository.save(passcode: passcode)
            lock.delegate?.passcodeLockDidSucceed(lock)
        } else {
            let mismatchTitle = L10n.PasscodeLock.Mismatch.title
            let mismatchDescription = L10n.PasscodeLock.Mismatch.description

            lock.changeState(SetPasscodeState(title: mismatchTitle, description: mismatchDescription))
            lock.delegate?.passcodeLockDidFail(lock)
        }
    }
}
