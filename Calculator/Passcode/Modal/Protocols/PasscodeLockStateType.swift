//
//  PasscodeLockStateType.swift
//  Photo Vault
//
//  Created by HASAN CAN on 10/8/20.
//  Copyright © 2020 pbstudio. All rights reserved.
//

import Foundation

public protocol PasscodeLockStateType {
    var title: String { get }
    var description: String { get }
    var isCancellableAction: Bool { get }
    var isTouchIDAllowed: Bool { get }

    mutating func accept(passcode: String, from lock: PasscodeLockType)
}
