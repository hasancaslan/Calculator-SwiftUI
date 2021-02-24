//
//  CalculatorModel.swift
//  Calculator
//
//  Created by HASAN CAN on 2/16/21.
//

import Foundation
import Combine

class CalculatorModel: ObservableObject {
    @Published var logic: CalculatorLogic = .left("0")
    var temporaryKept: [CalculatorButtonItem] = []
    
    func apply(_ item: CalculatorButtonItem) {
        logic = logic.apply(item: item)
        temporaryKept.removeAll()
    }
}
