//
//  FuturedViewController.swift
//  06-MVP-CVC
//
//  Created by Роман on 11.06.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class FuturedViewController: UIViewController {

    @IBOutlet weak var favoriteTableView: UITableView!
    
    //MARK: Futured View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.favoriteTableView.reloadData()
    }

}

//MARK: UITableViewDelegate and UITableViewDataSource conforming
extension FuturedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecordHandler.shared.favoriteRecords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let record = RecordHandler.shared.favoriteRecords[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.textLabel?.numberOfLines = 4
        cell.textLabel?.text = record.description()
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 3
    }
    
}
