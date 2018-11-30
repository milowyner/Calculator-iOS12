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
    
    var isFinishedTyping = true
    
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
        isFinishedTyping = true
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let digit = sender.currentTitle {
            
            if isFinishedTyping {
                displayLabel.text = "\(digit)"
                isFinishedTyping = false
            } else {
                displayLabel.text = displayLabel.text! + digit
            }
            
        }
        
    }

}

