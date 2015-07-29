//
//  ViewController.swift
//  Calculator
//
//  Created by cerjio on 28/07/15.
//  Copyright (c) 2015 cerjio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber: Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        //println("digit = \(digit)")
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
            
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }

}

