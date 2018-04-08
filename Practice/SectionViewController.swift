//
//  SectionViewController.swift
//  Practice
//
//  Created by Ian Yang on 3/22/18.
//  Copyright © 2018 Ian Yang. All rights reserved.
//

import UIKit
import CoreData

class SectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let headers = ["Favorite Quotes", "Quotes Bank"]
    var tableData:[String:[Quotes]] = ["Favorite Quotes":[],
        "Quotes Bank":[]]
    
    
    let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    let manageObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    

    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        fetchAllItems()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
//        let item = NSEntityDescription.insertNewObject(forEntityName: "Quotes", into: manageObjectContext) as! Quotes
//        item.author = "Vincent"
//        item.text = "Johnnie Tran with 100 Grand"
//        item.favorite = false
//        let item2 = NSEntityDescription.insertNewObject(forEntityName: "Quotes", into: manageObjectContext) as! Quotes
//        item2.author = "Vincent"
//        item2.text = "Kyle Kuzuma kruize control"
//        item2.favorite = false
//        let item3 = NSEntityDescription.insertNewObject(forEntityName: "Quotes", into: manageObjectContext) as! Quotes
//        item3.author = "Luther King"
//        item3.text = "I have a dream..."
//        item3.favorite = false
//        let item4 = NSEntityDescription.insertNewObject(forEntityName: "Quotes", into: manageObjectContext) as! Quotes
//        item4.author = "Eli"
//        item4.text = "Google it!"
//        item4.favorite = false
//        appDelegate.saveContext()
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func fetchAllItems(){
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Quotes")
        do {
            tableData["Quotes Bank"] = []
            tableData["Favorite Quotes"] = []
            let result = try manageObjectContext.fetch(request)
            var items = result as! [Quotes]
            for item in items {
                if item.favorite {
                    tableData["Favorite Quotes"]!.append(item)
                }
                else {
                    tableData["Quotes Bank"]!.append(item)
                }
            }
        } catch {
            print("\(error)")
        }
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headers.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let header = headers[section]
        return tableData[header]!.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let header = headers[indexPath.section]
        cell.textLabel?.text = tableData[header]![indexPath.row].text
        cell.detailTextLabel?.text = tableData[header]![indexPath.row].author
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var header = headers[indexPath.section]
        if header == "Favorite Quotes" {
            tableData["Quotes Bank"]!.append(tableData[header]![indexPath.row])
            tableData[header]![indexPath.row].favorite = false
            tableData[header]?.remove(at: indexPath.row)
            
        } else {
            tableData["Favorite Quotes"]!.append(tableData[header]![indexPath.row])
            tableData[header]![indexPath.row].favorite = true
            tableData[header]?.remove(at: indexPath.row)
        }
        appDelegate.saveContext()
        fetchAllItems()
        tableView.reloadData()
        
        
    }
}
