//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Milo Wyner on 11/30/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class CalculatorLogic {
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        switch symbol {
        case "AC":
            return 0
        case "+/-":
            return number * -1
        case "%":
            return number / 100
        default:
            return nil
        }
    }
}
