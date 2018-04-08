//
//  CustomSwipeViewController.swift
//  Practice
//
//  Created by Ian Yang on 3/22/18.
//  Copyright © 2018 Ian Yang. All rights reserved.
//

import UIKit

class CustomSwipeViewController: UIViewController {
    
    let people = ["Batman", "Mario", "Nate", "Thor", "Maggie Simpon"]
    let world = ["Gotham","Mario World", "Dogg House", "Asgard", "Springfield"]
    let nemesis = ["Joker", "Bowser", "Dog Treat", "Aliens", "Bart"]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var footLabel: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        footLabel.isHidden = true
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension CustomSwipeViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        cell.nameLabel.text = people[indexPath.row]
        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let cell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
        let nemesis = UITableViewRowAction(style: .destructive, title: "Nemesis") { (action, indexPath) in
            cell.dataLabel.isHidden = false
            cell.dataLabel.text = self.nemesis[indexPath.row]
            self.footLabel.isHidden = false
            self.footLabel.text = self.nemesis[indexPath.row]
        }
        
        let world = UITableViewRowAction(style: .normal, title: "World") { (action, indexPath) in
            cell.dataLabel.isHidden = false
            cell.dataLabel.text = self.world[indexPath.row]
            self.footLabel.isHidden = false
            self.footLabel.text = self.world[indexPath.row]
        }
        let clear = UITableViewRowAction(style: .normal, title: "Clear") { (action, indexPath) in
            cell.dataLabel.isHidden = true
            self.footLabel.isHidden = true
        }
        
        world.backgroundColor = UIColor.blue
        clear.backgroundColor = UIColor.yellow
        
        return [nemesis, world, clear]
    }
    
}
