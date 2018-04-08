//
//  ViewController.swift
//  Practice
//
//  Created by Ian Yang on 3/22/18.
//  Copyright © 2018 Ian Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchItem: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    @IBAction func switchToggle(_ sender: UISwitch) {
        if sender.isOn {
            switchLabel.text = "Switch is on"
        } else {
            switchLabel.text = "Switch is off"
            
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if switchItem.isOn {
            switchLabel.text = "Switch is on"
        } else {
            switchLabel.text = "Switch is off"
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

