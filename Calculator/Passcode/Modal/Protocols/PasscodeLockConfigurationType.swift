//
//  PasscodeLockConfigurationType.swift
//  Photo Vault
//
//  Created by HASAN CAN on 10/8/20.
//  Copyright © 2020 pbstudio. All rights reserved.
//

import Foundation

public protocol PasscodeLockConfigurationType {
    var repository: PasscodeRepositoryType { get }
    var passcodeLength: Int { get }
    var isTouchIDAllowed: Bool { get set }
    var shouldRequestTouchIDImmediately: Bool { get }
    var maximumIncorrectPasscodeAttempts: Int { get }
    func getIncorrectPasscodeAttempts() -> Int
    func setIncorrectPasscodeAttempts(_ value: Int)
}

private let incorrectPasscodeAttemptsKey = "incorrectPasscodeAttempts"

extension PasscodeLockConfigurationType {
    public func getIncorrectPasscodeAttempts() -> Int {
        return UserDefaults.standard.integer(forKey: incorrectPasscodeAttemptsKey)
    }

    public func setIncorrectPasscodeAttempts(_ value: Int) {
        UserDefaults.standard.set(value, forKey: incorrectPasscodeAttemptsKey)
    }
}
