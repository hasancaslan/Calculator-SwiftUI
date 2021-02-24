//
//  PasscodeRepositoryType.swift
//  Photo Vault
//
//  Created by HASAN CAN on 10/8/20.
//  Copyright © 2020 pbstudio. All rights reserved.
//

import Foundation

public protocol PasscodeRepositoryType {
    var hasPasscode: Bool { get }

    func save(passcode: String)
    func check(passcode: String) -> Bool
    func delete()
}
