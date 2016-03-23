//
//  ViewController.swift
//  Calculator_3_HW1
//
//  Created by Fliss Hou on 2016/3/23.
//  Copyright © 2016年 Fliss Hou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isFirstDigit = true
    var operand1: Double = 0
    var operation = "="
    
    var displayValue: Double{
        get{
            return NSNumberFormatter().numberFromString(displayLabel.text!)!.doubleValue
        }set{
            displayLabel.text = "\(newValue)"
            isFirstDigit = true
            operation = "="
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        displayLabel.text = isFirstDigit ? digit : displayLabel.text! + digit
        isFirstDigit = false
    }
  
    @IBAction func clear(sender: UIButton) {
        displayValue = 0
    }
    
    @IBAction func saveOperand(sender: UIButton) {
        operation = sender.currentTitle!
        operand1 = displayValue
        isFirstDigit = true
    }
    
    @IBAction func calculate(sender: AnyObject) {
        switch operation{
            case "+": displayValue = operand1 + displayValue
            case "-": displayValue = operand1 - displayValue
            case "×": displayValue = operand1 * displayValue
            case "÷": displayValue = operand1 / displayValue
            default: break
        }
        print("the displayvalue: \(displayValue)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

