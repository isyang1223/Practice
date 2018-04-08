//
//  RefinedFetchViewController.swift
//  Practice
//
//  Created by Ian Yang on 3/22/18.
//  Copyright © 2018 Ian Yang. All rights reserved.
//

import UIKit
import CoreData

class RefinedFetchViewController: UIViewController {
    
    let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    let manageObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView!
    var items = [Animal]()
    let tableData:[String: [String]] =
        ["Mammals": ["Fox",
                     "Dolphin",
                     "Dog",
                     "Mouse",
                     "Cat"
            ],
         "Reptiles": ["Snake",
                      "Lizards",
                      "Turtles",
                      "Chameleon",
                      "Nate"
            ]
    ]
    
    @IBAction func showAll(_ sender: UIButton) {
        fetchAllItems()
        tableView.reloadData()
    }
    @IBAction func showReptiles(_ sender: UIButton) {
        fetchReptiles()
        tableView.reloadData()
    }
    @IBAction func showMammals(_ sender: UIButton) {
        fetchMammals()
        tableView.reloadData()
    }
    func fetchMammals() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Animal")
        request.predicate = NSPredicate(format: "type == %@", "Mammals")
        do {
            let result = try manageObjectContext.fetch(request)
            items = result as! [Animal]
        } catch {
            print("\(error)")
        }
        
    }
    func fetchReptiles(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Animal")
        request.predicate = NSPredicate(format: "type == %@", "Reptiles")
        do {
            let result = try manageObjectContext.fetch(request)
            items = result as! [Animal]
        } catch {
            print("\(error)")
        }
    
    }
    
    func fetchAllItems(){
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Animal")
        do {
            let result = try manageObjectContext.fetch(request)
            items = result as! [Animal]
        } catch {
            print("\(error)")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
        tableView.dataSource = self
        tableView.delegate = self
//        for (type, names) in tableData {
//            for name in names {
//                let item = NSEntityDescription.insertNewObject(forEntityName: "Animal", into: manageObjectContext) as! Animal
//                item.name = name
//                item.type = type
//                appDelegate.saveContext()
//        
//            }
//        }
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}


extension RefinedFetchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }
    
    
    
    
}


