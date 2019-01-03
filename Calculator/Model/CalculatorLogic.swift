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
    private var equalsLastPressed = false
    private var operationLastPressed = false
    
    //------------------------
    //TODO: Clean up code
    //------------------------
    
    
    //TODO: change to pressNumber and add functionality for typing multi-digit numbers inside the class rather than outiside
    mutating func enterNumber(_ numberString: String) -> String {
        guard let number = Double(numberString) else {
            fatalError("Invalid number entered")
        }
        print(operationLastPressed)
        if operationLastPressed == false {
            num1 = number
        } else {
            num2 = number
            operationLastPressed = false
        }
        print(#line, num1 as Any, operation as Any, num2 as Any)
        return numberString
    }
    
    mutating func pressOperation(_ op: String) -> String? {
        
        guard let n1 = num1 else {
            return nil
        }
        
        if equalsLastPressed {
            num2 = nil
            equalsLastPressed = false
        }
        
        switch op {
        case "AC":
            num1 = nil
            operation = nil
            num2 = nil
            operationLastPressed = false
            print(#line, num1 as Any, operation as Any, num2 as Any)
            return "0"
        case "+/-":
            num1 = n1 * -1
            return convertToString(num1!)
        case "%":
            num1 = n1 / 100
            return convertToString(num1!)
        default:
            operationLastPressed = true

            if num2 != nil {
                let result = calculateResult()
                num1 = result
                operation = op
                print(#line, num1 as Any, operation as Any, num2 as Any)
                return convertToString(result)
            } else {
                operation = op
                print(#line, num1 as Any, operation as Any, num2 as Any)
                return nil
            }
            
        }
    }
    
    mutating func pressEquals() -> String {
        equalsLastPressed = true
        let result = calculateResult()
        num1 = result
        print(#line, num1 as Any, operation as Any, num2 as Any)
        return convertToString(result)
    }
    
    private func calculateResult() -> Double {
        guard let n1 = num1 else {
            return 0
        }
        guard let op = operation else {
            return n1
        }
        var n2: Double
        if let temp = num2 {
            n2 = temp
        } else {
            n2 = n1
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
 
 ---
 
 1. Press number. Displays number.
 2. Press equals. Displays number.
 
 */
