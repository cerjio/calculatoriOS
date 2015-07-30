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
    
    var userIsInTheMiddleOfTypingANumber = false
    
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
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        
        switch operation {
            case "×": performOperation { $0 * $1}
            case "÷": performOperation { $1 / $0}
            case "+": performOperation { $0 + $1}
            case "−": performOperation { $1 - $0}
            case "√": performOperation2 { sqrt($0)}
            default : break
        }
    }
    
    /**
        Overloading issue https://www.reddit.com/r/swift/comments/34yusl/help_with_function_overloading/
    
    
    */
    func performOperation(operation: (Double, Double) -> Double) {
    
            if operandStack.count >= 2 {
                displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
                enter()
            }
            
    }
    
    func performOperation2(operation: (Double) -> Double) {
        
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
        
    }

    
    //Bad form in swift can be infered the type
    //var operandStack: Array<Double> = Array<Double>()
    var operandStack = Array<Double>()

    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
        
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
            
        }
    }

}

