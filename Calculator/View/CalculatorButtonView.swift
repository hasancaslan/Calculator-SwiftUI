//
//  CalculatorButtonView.swift
//  Calculator
//
//  Created by HASAN CAN on 2/16/21.
//

import Foundation
import SwiftUI

struct CalculatorButtonView: View {
    var buttonItem: CalculatorButtonItem
    @EnvironmentObject var model: CalculatorModel

    var body: some View {
        Button(buttonItem.title, action: {
            self.model.apply(buttonItem)
        })
        .buttonStyle(CalculatorButtonStyle(buttonItem: buttonItem))
    }
}
