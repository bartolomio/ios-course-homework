//
//  FullListViewController.swift
//  06-MVP-CVC
//
//  Created by Роман on 11.06.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class FullListViewController: UIViewController {

    var fullListTableView: UITableView = UITableView()
    var action: Action = Action.no_Action
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fullListTableView.delegate = self
        self.fullListTableView.dataSource = self
        self.fullListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(fullListTableView)
        self.fullListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        fullListTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        fullListTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        fullListTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        fullListTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: NSNotification.Name(rawValue: "record_edited"), object: nil)

    }
    
    @objc func reloadTableView(notification: Notification) {
        if notification.name.rawValue == "record_edited" {
            print("[LOG MESSAGE] Notification received")
            self.fullListTableView.reloadData()
        }
    }
    
    @IBAction func onAddButtonTapped(_ sender: Any) {
        self.action = Action.add_Record
        self.performSegue(withIdentifier: "toActionView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let actionViewController = segue.destination as? ActionViewController {
            actionViewController.delegate = self
            actionViewController.action = self.action
            if self.action == Action.edit_Record {
                if let selectedRow = self.fullListTableView.indexPathForSelectedRow?.row {
                    actionViewController.oldRecord = RecordHandler.shared.records[selectedRow]
                    actionViewController.deleteButtonHiden = false
                    actionViewController.deleteButtonEnabled = true
                }
            }
        }
    }

}

//MARK: UITableViewDelegate and UITableViewDataSource conforming
extension FullListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecordHandler.shared.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let record = RecordHandler.shared.records[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.textLabel?.numberOfLines = 4
        cell.textLabel?.text = record.description()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.action = Action.edit_Record
        self.performSegue(withIdentifier: "toActionView", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 3
    }
}

//MARK: ActionViewControllerDelegate conforming
extension FullListViewController: ActionViewControllerDelegate{
    
    func addRecord(record: Record) {
        RecordHandler.shared.records.append(record)
        self.fullListTableView.beginUpdates()
        let indexPath = IndexPath(row: RecordHandler.shared.records.count - 1, section: 0)
        self.fullListTableView.insertRows(at: [indexPath], with: .automatic)
        self.fullListTableView.endUpdates()
    }
    
    func deleteRecord() {
        if let selectedRow = self.fullListTableView.indexPathForSelectedRow?.row{
            RecordHandler.shared.records.remove(at: selectedRow)
        }
        self.fullListTableView.reloadData()
    }
}
