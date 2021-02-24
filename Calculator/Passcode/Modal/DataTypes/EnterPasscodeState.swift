//
//  EnterPasscodeState.swift
//  Photo Vault
//
//  Created by HASAN CAN on 10/8/20.
//  Copyright © 2020 pbstudio. All rights reserved.
//

import Foundation

public let PasscodeLockIncorrectPasscodeNotification = Notification.Name("passcode.lock.incorrect.passcode.notification")

struct EnterPasscodeState: PasscodeLockStateType {
    let title: String
    let description: String
    let isCancellableAction: Bool
    var isTouchIDAllowed = true
    private var isNotificationSent = false

    init(allowCancellation: Bool = false) {
        isCancellableAction = allowCancellation
        title = L10n.PasscodeLock.Enter.title
        description = L10n.PasscodeLock.Enter.description
    }

    mutating func accept(passcode: String, from lock: PasscodeLockType) {
        if lock.repository.check(passcode: passcode) {
            lock.delegate?.passcodeLockDidSucceed(lock)
            lock.configuration.setIncorrectPasscodeAttempts(0)
        } else {
            let oldValue = lock.configuration.getIncorrectPasscodeAttempts()
            lock.configuration.setIncorrectPasscodeAttempts(oldValue + 1)

            if lock.configuration.getIncorrectPasscodeAttempts() >= lock.configuration.maximumIncorrectPasscodeAttempts {
                postNotification()
            }

            lock.delegate?.passcodeLockDidFail(lock)
        }
    }

    private mutating func postNotification() {
        guard !isNotificationSent else { return }
        NotificationCenter.default.post(name: PasscodeLockIncorrectPasscodeNotification, object: nil)
        isNotificationSent = true
    }
}
