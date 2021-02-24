//
//  UserDefaultsPasscodeRepository.swift
//  Photo Vault
//
//  Created by HASAN CAN on 10/8/20.
//  Copyright © 2020 pbstudio. All rights reserved.
//

import Foundation

public enum PasscodeError: Error {
    case noPasscode
}

class UserDefaultsPasscodeRepository: PasscodeRepositoryType {
    private let passcodeKey = "passcode.lock.passcode"

    private lazy var defaults: UserDefaults = {
        UserDefaults.standard
    }()

    var hasPasscode: Bool {
        if passcode != nil {
            return true
        }

        return false
    }

    private var passcode: String? {
        return defaults.value(forKey: passcodeKey) as? String
    }

    func save(passcode: String) {
        defaults.set(passcode, forKey: passcodeKey)
        defaults.synchronize()
    }

    func check(passcode: String) -> Bool {
        return self.passcode == passcode
    }

    func delete() {
        defaults.removeObject(forKey: passcodeKey)
        defaults.synchronize()
    }
}
