//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Milo Wyner on 11/30/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    var number: Double?
    
    func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "AC":
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            default:
                return nil
            }
        }
        return nil
    }
}
