//
//  CalculatorButtonStyle.swift
//  Calculator
//
//  Created by HASAN CAN on 2/16/21.
//

import Foundation
import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
    var buttonItem: CalculatorButtonItem

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: self.buttonItem.size.width, height: self.buttonItem.size.height, alignment: .center)
            .font(self.buttonItem.font)
            .background(configuration.isPressed ? Color(white: 1, opacity: 0.8) : self.buttonItem.background)
            .foregroundColor(self.buttonItem.foreground)
            .cornerRadius(self.buttonItem.size.height)
    }
}
