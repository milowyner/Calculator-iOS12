//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var safeAreaBlur: UIStackView!
    
    private var isFinishedTyping = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Could not convert display label text to double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        safeAreaBlur.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        safeAreaBlur.insertSubview(blurView, at: 0)

        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            ])

    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        
        // TODO: Make it so that numbers displayed in the display text only show a decimal
        // place if they're not an integer
        
        isFinishedTyping = true
        
        if let button = sender.currentTitle {
            
            switch button {
            case "AC":
                displayLabel.text = "0"
            case "+/-":
                displayValue *= -1
            case "%":
                displayValue /= 100
            default:
                return
            }
            
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTyping {
                
                if numValue == "." {
                    displayLabel.text = "0."
                } else {
                    displayLabel.text = numValue
                }
                isFinishedTyping = false
                
            } else {
                if numValue != "." || displayLabel.text!.contains(".") == false {
                    displayLabel.text = displayLabel.text! + numValue
                }
            }
            
        }
        
    }

}

