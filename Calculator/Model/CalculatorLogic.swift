//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by HASAN CAN on 2/16/21.
//

import Foundation

enum CalculatorLogic {
    case left(String)
    case leftOp(left: String, operand: CalculatorButtonItem.Operand)
    case leftOpRight(left: String, operand: CalculatorButtonItem.Operand, right: String)
    case error

    var output: String {
        let result: String
        switch self {
        case let .left(left):
            result = left

        case let .leftOp(left, _):
            result = left

        case let .leftOpRight(_, _, right):
            result = right

        case .error:
            return "Error"
        }

        guard let value = Double(result) else { return "Error" }

        return formatter.string(from: value as NSNumber)!
    }

    @discardableResult
    func apply(item: CalculatorButtonItem) -> CalculatorLogic {
        switch item {
        case let .digit(num):
            return apply(num: num)

        case .dot:
            return applyDot()

        case let .operand(operand):
            return apply(operand: operand)

        case let .command(command):
            return apply(command: command)
        }
    }

    private func apply(num: Int) -> CalculatorLogic {
        switch self {
        case let .left(left):
            return .left(left.apply(num: num))

        case let .leftOp(left, operand):
            return .leftOpRight(left: left, operand: operand, right: "0".apply(num: num))

        case let .leftOpRight(left, operand, right):
            return .leftOpRight(left: left, operand: operand, right: right.apply(num: num))

        case .error:
            return .left("0".apply(num: num))
        }
    }

    private func applyDot() -> CalculatorLogic {
        switch self {
        case let .left(left):
            return .left(left.applyDot())

        case let .leftOp(left, operand):
            return .leftOpRight(left: left, operand: operand, right: "0".applyDot())

        case let .leftOpRight(left, operand, right):
            return .leftOpRight(left: left, operand: operand, right: right.applyDot())

        case .error:
            return .left("0".applyDot())
        }
    }

    private func apply(operand: CalculatorButtonItem.Operand) -> CalculatorLogic {
        switch self {
        case let .left(left):
            switch operand {
            case .plus, .minus, .multiply, .divide:
                return .leftOp(left: left, operand: operand)

            case .equal:
                return self
            }

        case let .leftOp(left, currentOp):
            switch operand {
            case .plus, .minus, .multiply, .divide:
                return .leftOp(left: left, operand: operand)

            case .equal:
                if let result = currentOp.calculate(lhs: left, rhs: left) {
                    return .leftOp(left: result, operand: currentOp)
                } else {
                    return .error
                }
            }

        case let .leftOpRight(left, currentOp, right):
            switch operand {
            case .plus, .minus, .multiply, .divide:
                if let result = currentOp.calculate(lhs: left, rhs: right) {
                    return .leftOp(left: result, operand: operand)
                } else {
                    return .error
                }

            case .equal:
                if let result = currentOp.calculate(lhs: left, rhs: right) {
                    return .left(result)
                } else {
                    return .error
                }
            }

        case .error:
            return self
        }
    }

    private func apply(command: CalculatorButtonItem.Command) -> CalculatorLogic {
        switch command {
        case .clear:
            return .left("0")

        case .flip:
            switch self {
            case let .left(left):
                return .left(left.flipped())

            case let .leftOp(left, operand):
                return .leftOpRight(left: left, operand: operand, right: "-0")

            case let .leftOpRight(left: left, operand, right):
                return .leftOpRight(left: left, operand: operand, right: right.flipped())

            case .error:
                return .left("-0")
            }

        case .percent:
            switch self {
            case let .left(left):
                return .left(left.percentaged())

            case .leftOp:
                return self

            case let .leftOpRight(left: left, operand, right):
                return .leftOpRight(left: left, operand: operand, right: right.percentaged())

            case .error:
                return .left("-0")
            }
        }
    }
}

var formatter: NumberFormatter = {
    let numbarFormatter = NumberFormatter()
    numbarFormatter.minimumFractionDigits = 0
    numbarFormatter.maximumFractionDigits = 8
    numbarFormatter.numberStyle = .decimal
    return numbarFormatter
}()

extension String {
    var containsDot: Bool {
        return contains(".")
    }

    var startWithNegative: Bool {
        return starts(with: "-")
    }

    func apply(num: Int) -> String {
        return self == "0" ? "\(num)" : "\(self)\(num)"
    }

    func applyDot() -> String {
        return containsDot ? self : "\(self)."
    }

    func flipped() -> String {
        if startWithNegative {
            var selfVar = self
            selfVar.removeFirst()
            return selfVar
        } else {
            return "-\(self)"
        }
    }

    func percentaged() -> String {
        return String(Double(self)! / 100)
    }
}

extension CalculatorButtonItem.Operand {
    func calculate(lhs: String, rhs: String) -> String? {
        guard let left = Double(lhs), let right = Double(rhs) else { return nil }

        let result: Double?
        switch self {
        case .plus:
            result = left + right

        case .minus:
            result = left - right

        case .multiply:
            result = left * right

        case .divide:
            result = right == 0 ? nil : left / right

        case .equal:
            fatalError()
        }

        return result.map { String($0) }
    }
}
