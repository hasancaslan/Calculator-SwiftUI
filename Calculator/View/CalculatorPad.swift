//
//  CalculatorPad.swift
//  Calculator
//
//  Created by HASAN CAN on 2/16/21.
//

import Foundation
import SwiftUI

struct CalculatorButtonPad: View {
    let spacing: CGFloat
    
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    
    var body: some View {
        VStack(spacing: spacing) {
            ForEach(pad, id: \.self) { row in
                HStack(spacing: self.spacing) {
                    ForEach(row, id: \.self) { button in
                        CalculatorButtonView(buttonItem: button)
                    }
                }
            }
        }
    }
}

struct CalculatorButtonPad_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalculatorButtonPad(spacing: 16)
        }
    }
}
