//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Milo Wyner on 11/30/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    var num1: Double?
    var operation: String?
    var num2: Double?
    private var operationLastPressed = false
    
    mutating func enterNumber(_ numberString: String) -> String {
        guard let number = Double(numberString) else {
            fatalError("Invalid number entered")
        }
        if operationLastPressed == false {
            num1 = number
        } else {
            num2 = number
        }
        return numberString
    }
    
    mutating func pressOperation(_ operation: String) -> String? {
        guard let n1 = num1 else {
            return nil
        }
        switch operation {
        case "AC":
            return "0"
        case "+/-":
            num1 = n1 * -1
            return convertToString(num1!)
        case "%":
            num1 = n1 / 100
            return convertToString(num1!)
        default:
            if operationLastPressed == false {
                self.operation = operation
                operationLastPressed = true
                return nil
            } else {
                let result = calculateResult()
                num1 = result
                return convertToString(result)
            }
        }
    }
    
    mutating func pressEquals() -> String {
        operationLastPressed = false
        let result = calculateResult()
        num1 = result
        return convertToString(result)
    }
    
    private func calculateResult() -> Double {
        guard let n1 = num1, let op = operation, let n2 = num2 else {
            fatalError("Could not unwrap all of the calculation variables")
        }
        
        switch op {
        case "+":
            return n1 + n2
        case "-":
            return n1 - n2
        case "×":
            return n1 * n2
        case "÷":
            return n1 / n2
        default:
            fatalError("The operation passed in does not match any of the cases")
        }
    }
    
    private func convertToString(_ result: Double) -> String {
        if floor(result) == result {
            return String(Int(result))
        } else {
            return String(result)
        }
    }
}

/*
 
 equalsPressed = true
 
 if equals was pressed {
    result = n1 op n2 // put into function
    display result // put into function
    n1 = result // put into function
    equalsPressed = true
 }
 
 if operation was pressed {
     if equalsPressed == true {
        op = operation
        equalsPressed = false
     } else {
        result = n1 op n2 // put into function
        display result // put into function
        n1 = result // put into function
     }
 }
 
 if number was pressed {
    if equalsPressed == true {
        display number // optimize later
        n1 = number
        equalsPressed = false
    } else {
        display number // optimize later
        n2 = number
    }
 }
 
 */
