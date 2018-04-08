//
//  DatePickerViewController.swift
//  Practice
//
//  Created by Ian Yang on 3/22/18.
//  Copyright © 2018 Ian Yang. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    @IBOutlet weak var shortDateLabel: UILabel!
    @IBOutlet weak var mediumDateLabel: UILabel!
    @IBOutlet weak var longDateLabel: UILabel!
    
    @IBOutlet weak var datePickerOutlet: UIDatePicker!
    let dateFormatter = DateFormatter()
    
    
    @IBAction func datePickerUpdate(_ sender: UIDatePicker) {
        updateDate()
        
    }
    
    func updateDate(){
        
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .short
        shortDateLabel.text = dateFormatter.string(from: datePickerOutlet.date)
        dateFormatter.dateStyle = .medium
        mediumDateLabel.text = dateFormatter.string(from: datePickerOutlet.date)
        dateFormatter.dateStyle = .long
        longDateLabel.text = dateFormatter.string(from: datePickerOutlet.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDate()
    
    

        // Do any additional setup after loading the view.
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
