//
//  ViewController.swift
//  tipcalc
//
//  Created by Hugh Bromund on 1/22/20.
//  Copyright © 2020 Hugh Bromund. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        billField.placeholder = currencySymbol + "0.00"
        tipLabel.text = currencySymbol + "0.00"
        totalLabel.text = currencySymbol + "0.00"
        
        billField.becomeFirstResponder()
    }
    @IBAction func onTap(_ sender: Any) {
        print("Hello")
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // ?? means if left isn't vaild use right
        let bill = Double(billField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.20]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = bill + tip
        
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true;
        formatter.locale = Locale.current
        
        let tipOutput = formatter.string(from: NSNumber(value: tip))!
        let totalOutput = formatter.string(from: NSNumber(value: total))!
        
        
        tipLabel.text = tipOutput
        totalLabel.text = totalOutput
    }
    
}

