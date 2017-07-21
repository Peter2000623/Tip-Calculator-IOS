//
//  ViewController.swift
//  TipPro for Product
//
//  Created by appa on 2017/7/19.
//  Copyright © 2017年 Peter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalAmountField: UITextField!

    @IBAction func calculatetip(_ sender: Any) {
        if let billAmount = Double(billAmountField.text!) {
            var tipPercentage = 0.0
            
            switch tipSelector.selectedSegmentIndex {
            case 0:
                tipPercentage = 0.15
            case 1:
                tipPercentage = 0.18
            case 2:
                tipPercentage = 0.20
            default:
                break
            }
            
            let roundedBillAmount = round(100 * billAmount) / 100
            let tipAmount = roundedBillAmount * tipPercentage
            let roundedTipAmount = round(100*tipAmount)/100
            let totalAmount = roundedBillAmount + roundedTipAmount
            
            if (!billAmountField.isEditing) {
                billAmountField.text = String(roundedBillAmount)
            }
            tipAmountField.text = String(roundedTipAmount)
            totalAmountField.text = String(totalAmount)
        } else {
            //show error
            billAmountField.text = ""
            tipAmountField.text = ""
            totalAmountField.text = ""
        }
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

