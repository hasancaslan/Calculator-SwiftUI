//
//  CalculatorButtonItem.swift
//  Calculator
//
//  Created by HASAN CAN on 2/16/21.
//

import Foundation
import SwiftUI

enum CalculatorButtonItem {
    enum Op: String {
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
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
}

extension CalculatorButtonItem {
    var title: String {
        switch self {
        case .digit(let value):
            return String(value)
        case .dot:
            return "."
        case .op(let op):
            return op.rawValue
        case .command(let command):
            return command.rawValue
        }
    }
    
    var spacing: CGFloat {
        return 16
    }
    
    var size: CGSize {
        let width = (UIScreen.main.bounds.width - 5 * spacing) / 4
        
        switch self {
        case .digit(let value):
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
        case .op:
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
        case .op:
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
        case .digit(let num): return String(num)
        case .dot: return "."
        case .op(let op): return op.rawValue
        case .command(let command): return command.rawValue
        }
    }
}
