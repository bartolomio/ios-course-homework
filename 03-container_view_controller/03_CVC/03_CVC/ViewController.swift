//
//  ViewController.swift
//  03_CVC
//
//  Created by Роман on 22.05.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTable: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    
    var records: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let width = mainTable.frame.width / 2
        addButton.widthAnchor.constraint(equalToConstant: width).isActive = true
        removeButton.widthAnchor.constraint(equalToConstant: width).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onAddButton(_ sender: Any) {
        mainTable.setEditing(true, animated: true)
        //records.append("wwdwwwwws")
        
        let record = Record(name: "name1", text: "text1", tags: "tag11,tag12")
        records.append(record.description())
        mainTable.beginUpdates()
        let indexPath = IndexPath(row: records.count - 1, section: 0)
        mainTable.insertRows(at: [indexPath], with: .automatic)
        
        mainTable.endUpdates()
        

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
        cell.textLabel?.text = record
        
        return cell
    }
    
    
}

