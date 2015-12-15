//
//  SettingsViewController.swift
//  tippy
//
//  Created by twen6 on 12/14/15.
//  Copyright (c) 2015 twen6. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let defaults = NSUserDefaults.standardUserDefaults()
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet var bg: UIView!
    @IBOutlet weak var nightSwitch: UISwitch!
    @IBOutlet weak var defaultLabel: UILabel!
    @IBOutlet weak var nightLabel: UILabel!
    var tipPercentages = [0.15, 0.2, 0.25]
    var p = UIColor(red:0.58, green:0.38, blue:0.70, alpha:1.0)
    var w = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipControl.selectedSegmentIndex = defaults.integerForKey("defaultTip")
        // Do any additional setup after loading the view.
        if(defaults.boolForKey("nightMode")){
            nightSwitch.on = true
            tipControl.tintColor = w
            nightSwitch.tintColor = w
            defaultLabel.textColor = w
            nightLabel.textColor = w
            bg.backgroundColor = p
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tipChange(sender: AnyObject) {
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "defaultTip")
        
        if(nightSwitch.on){
            defaults.setBool(true, forKey: "nightMode")
            tipControl.tintColor = w
            nightSwitch.tintColor = w
            defaultLabel.textColor = w
            nightLabel.textColor = w
            bg.backgroundColor = p
        } else {
            defaults.setBool(false, forKey: "nightMode")
            tipControl.tintColor = p
            nightSwitch.tintColor = p
            defaultLabel.textColor = p
            nightLabel.textColor = p
            bg.backgroundColor = w
        }
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
