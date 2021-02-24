//
//  ContentView.swift
//  Calculator
//
//  Created by HASAN CAN on 2/16/21.
//

import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject var model: CalculatorModel
    
    let spacing: CGFloat = 14
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: self.spacing) {
                HStack {
                    Spacer()
                    Text(model.logic.output)
                        .foregroundColor(.white)
                        .font(.system(size: 90, weight: .thin))
                }.padding(.horizontal, 24)
                
                CalculatorButtonPad(spacing: spacing)
            }.padding(.bottom, 40)
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalculatorView().environmentObject(CalculatorModel())
        }
    }
}
