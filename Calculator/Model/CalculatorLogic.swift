//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Milo Wyner on 11/30/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

/*
 
 Press number. Since equalsPressed == true, Saves as number 1 and set equalsPressed = false. Displays number 1. displayed: 4, stored: (4, nil, nil)
 Press operation. Saves operation. stored: (4, +, nil)
 Press another number. Saves as number 2. Displays number 2. displayed: 5, stored: (4, +, 5)
 Press equals. Calculates result and displays result. Stores result as number 1. equalsPressed = true. displayed: 9, stored (9, +, 5)
    Press equals again. Calculates result and displays result. Stores result as number 1. equalsPressed = true. displayed: 14, stored: (14, +, 5)
    or
    //number after equals
    Press number. Since equalsPressed == true, Saves as number 1 and set equalsPressed = false. Displays number 1. displayed: 6, stored: (6, +, 5)
    Press operation. Saves operation. stored: (6, +, 5)
        Press number. Since equalsPressed == false, Stores as number 2. Displays number 2. displays 3, stored: (6, +, 3)
        Press equals. Calculates result and displays result. Stores result as number 1. displayed: 9, stored: (9, +, 3)
        or
        Press another operation. Calculates result and displays result. Stores result into number 1. displayed: 9, stored: (9, +, 3)
            Press another number. Stores as number 2. Displays number 2. displayed 2. stored (9, +, 2)
            Press equals. Calculates result and displays result. Stores result as number 1. displays 11, stored (11, +, 2)
 or
 Press another operation. Calculates result and displays result. Stores result as number 1. displayed 9, stored (9, +, 5)
    Press another number. Stores as number 2. Displays number 2. displayed 7, stored (9, +, 7)
    Press equals. Calculates result and displays result. Stores result into number 1. displayed 16, stored (16, +, 7)
        //number after equals
        Press another number. Since equalsPressed == true, saves as number 1 and set equalsPressed = false. Displays number 1. displayed 8, stored (8, +, 7)
    or
    Press another operation. Calculations result and displays result. Stores result into number 1. displayed 16, stored (16, + 7)
        Press another number. Stores as number 2. Displays number 2. displayed 1, stored (16, +, 1)
        Press another operation. Calculations result and displays result. Stores result into number 1. displayed 17, stored (17, + 7)
 
    ...
 
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
