//
//  CalculatorButtonItem.swift
//  Calculator
//
//  Created by HASAN CAN on 2/16/21.
//

import Foundation
import SwiftUI

enum CalculatorButtonItem {
    case digit(Int)
    case dot
    case operand(Operand)
    case command(Command)

    enum Operand: String {
        case plus = "+"
        case minus = "-"
        case multiply = "×"
        case divide = "÷"
        case equal = "="
    }

    enum Command: String {
        case clear = "AC"
        case flip = "±"
        case percent = "%"
    }
}

extension CalculatorButtonItem {
    var title: String {
        switch self {
        case let .digit(value):
            return String(value)

        case .dot:
            return "."
        case let .operand(operand):
            return operand.rawValue

        case let .command(command):
            return command.rawValue
        }
    }

    var spacing: CGFloat {
        return 16
    }

    var size: CGSize {
        let width = (UIScreen.main.bounds.width - 5 * spacing) / 4

        switch self {
        case let .digit(value):
            if value == 0 {
                return CGSize(width: width * 2 + spacing, height: width)
            }

        default:
            break
        }

        return CGSize(width: width, height: width)
    }

    var background: Color {
        switch self {
        case .command:
            return Color(red: 0.647, green: 0.647, blue: 0.647)

        case .operand:
            return Color(red: 0.941, green: 0.600, blue: 0.216)

        case .digit, .dot:
            return Color(red: 0.200, green: 0.200, blue: 0.200)
        }
    }

    var foreground: Color {
        switch self {
        case .command:
            return Color(.black)

        default:
            return Color(.white)
        }
    }

    var font: Font {
        switch self {
        case .command:
            return .system(size: 32)

        case .operand:
            return .system(size: 42)

        default:
            return .system(size: 36)
        }
    }
}

extension CalculatorButtonItem: Hashable {}

extension CalculatorButtonItem: CustomStringConvertible {
    var description: String {
        switch self {
        case let .digit(num):
            return String(num)

        case .dot:
            return "."

        case let .operand(operand):
            return operand.rawValue

        case let .command(command):
            return command.rawValue
        }
    }
}
