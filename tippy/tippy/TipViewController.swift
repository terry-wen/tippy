//
//  ViewController.swift
//  tippy
//
//  Created by twen6 on 12/14/15.
//  Copyright (c) 2015 twen6. All rights reserved.
//

import UIKit

extension Double {
    var asLocaleCurrency:String {
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        return formatter.stringFromNumber(self)!
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentageControl: UISegmentedControl!
    @IBOutlet weak var outputView: UIView!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var threeWay: UILabel!
    @IBOutlet weak var fourWay: UILabel!
    @IBOutlet weak var twoWay: UILabel!
    @IBOutlet weak var tip: UILabel!
    @IBOutlet weak var subView: UIView!
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var p = UIColor(red:0.58, green:0.38, blue:0.70, alpha:1.0)
    var w = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billField.becomeFirstResponder()
        outputView.alpha = 0
        billField.frame.origin.y = 254
        outputView.frame.origin.y = 322
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if(defaults.boolForKey("nightMode")){
            billField.textColor = w
            subView.backgroundColor = p
            tipLabel.textColor = w
            tip.textColor = w
            percentageControl.tintColor = w
            view.backgroundColor = p
        } else {
            billField.textColor = p
            subView.backgroundColor = w
            tipLabel.textColor = p
            tip.textColor = p
            percentageControl.tintColor = p
            view.backgroundColor = w
        }
        percentageControl.selectedSegmentIndex = defaults.integerForKey("defaultTip")
    }

    @IBAction func billChanged(sender: AnyObject) {
        if(!billField.text.isEmpty){
            UIView.animateWithDuration(0.4, animations: {
                self.outputView.alpha = 1
                self.billField.frame.origin.y = 74
                self.outputView.frame.origin.y = 142
            })
            
            var tipPercentages = [0.15, 0.2, 0.25]
            var tipPercentage = tipPercentages[percentageControl.selectedSegmentIndex]
        
            var billAmount:Double = NSString(string:billField.text).doubleValue
            var t = billAmount * tipPercentage
            var total = billAmount + t
            var twoSplit = total / 2
            var threeSplit = total / 3
            var fourSplit = total / 4
            
            tipLabel.text = t.asLocaleCurrency
            totalLabel.text = total.asLocaleCurrency
            twoWay.text = twoSplit.asLocaleCurrency
            threeWay.text = threeSplit.asLocaleCurrency
            fourWay.text = fourSplit.asLocaleCurrency
            
        }
        else {
            UIView.animateWithDuration(0.4, animations: {
                self.outputView.alpha = 0
                self.billField.frame.origin.y = 254
                self.outputView.frame.origin.y = 322
            })
        }
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

