//
//  ViewController.swift
//  03_CVC
//
//  Created by Роман on 22.05.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AddScreenViewControllerDelegate {
    
    @IBOutlet weak var mainTable: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    
    var records: [Record] = [Record]()
    
    var action: Action = Action.no_Action
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let width = mainTable.frame.width / 2
        addButton.widthAnchor.constraint(equalToConstant: width).isActive = true
        editButton.widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addRecord(record: Record) {
        records.append(record)
        mainTable.beginUpdates()
        let indexPath = IndexPath(row: records.count - 1, section: 0)
        mainTable.insertRows(at: [indexPath], with: .automatic)
        mainTable.endUpdates()
    }
    
    func updateRecord(record: Record) {
        if let selectedRow = mainTable.indexPathForSelectedRow?.row{
            records[selectedRow] = record
            mainTable.reloadRows(at: [mainTable.indexPathForSelectedRow!], with: .none)
            editButton.isEnabled = false
        }
    }
    
    func deleteRecord() {
        if let selectedRow = mainTable.indexPathForSelectedRow?.row{
            records.remove(at: selectedRow)
        }
        mainTable.reloadData()
        editButton.isEnabled = false
    }
    
    @IBAction func onAddButton(_ sender: Any) {
        self.action = Action.add_Record
        self.performSegue(withIdentifier: "toAddWindow", sender: Any?.self)

    }
    
    @IBAction func onEditButton(_ sender: Any) {
        self.action = Action.edit_Record
        self.performSegue(withIdentifier: "toAddWindow", sender: Any?.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addScreenViewController = segue.destination as? AddScreenViewController {
            addScreenViewController.delegate = self
            addScreenViewController.action = self.action
            if self.action == Action.edit_Record {
                if let selectedRow = mainTable.indexPathForSelectedRow?.row {
                    addScreenViewController.name = records[selectedRow].name
                    addScreenViewController.tags = records[selectedRow].tagsAsString()
                    addScreenViewController.text = records[selectedRow].text
                    addScreenViewController.deleteButtonHiden = false
                    addScreenViewController.deleteButtonEnabled = true
                }
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let record = records[indexPath.row]
        
        let cell = mainTable.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.numberOfLines = 4
        cell.textLabel?.text = record.description()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        editButton.isEnabled = true
    }
    
    
    
}

