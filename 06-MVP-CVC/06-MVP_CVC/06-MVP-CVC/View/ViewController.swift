//
//  ViewController.swift
//  04-frame_bounds
//
//  Created by Роман on 27.05.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView = UITableView()
    var records: [Record] = [Record]()
    var action: Action = Action.no_Action
    @IBOutlet weak var editButton: UIButton!
    var conststrains: [NSLayoutConstraint] = [NSLayoutConstraint]()
    
    
    
    override func viewDidLoad() {
       
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leadingAnchor.constraint(equalTo: self.editButton.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.editButton.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.editButton.topAnchor, constant: -40).isActive = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: NSNotification.Name(rawValue: "record_edited"), object: nil)
        
        super.viewDidLoad()
        
    }
    
    @IBAction func onAddButtonTapped(_ sender: Any) {
        self.action = Action.add_Record
        self.performSegue(withIdentifier: "toActionView", sender: self)
    }
    
    @IBAction func onEditButtonTapped(_ sender: Any) {
        self.action = Action.edit_Record
        self.performSegue(withIdentifier: "toActionView", sender: self)
    }
    
    @objc func reloadTableView(notification: Notification) {
        if notification.name.rawValue == "record_edited" {
            print("[LOG MESSAGE] Notification received")
            self.tableView.reloadData()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let actionViewController = segue.destination as? ActionViewController {
            actionViewController.delegate = self
            actionViewController.action = self.action
            if self.action == Action.edit_Record {
                if let selectedRow = self.tableView.indexPathForSelectedRow?.row {
                    actionViewController.oldRecord = records[selectedRow]
                    actionViewController.deleteButtonHiden = false
                    actionViewController.deleteButtonEnabled = true
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.textLabel?.numberOfLines = 4
        cell.textLabel?.text = record.description()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        editButton.isEnabled = true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 3
    }
    
}

extension ViewController: ActionViewControllerDelegate{
   
    func addRecord(record: Record) {
        self.records.append(record)
        self.tableView.beginUpdates()
        let indexPath = IndexPath(row: self.records.count - 1, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
        self.tableView.endUpdates()
    }
    
    func updateRecord() {
        editButton.isEnabled = false
    }
    
    func deleteRecord() {
        if let selectedRow = self.tableView.indexPathForSelectedRow?.row{
            records.remove(at: selectedRow)
        }
        self.tableView.reloadData()
        editButton.isEnabled = false
    }
    
    
}

