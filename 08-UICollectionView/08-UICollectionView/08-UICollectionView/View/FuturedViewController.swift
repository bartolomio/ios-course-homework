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
    
    var cellWhiteColor = true
    
    //MARK: Futured View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(setBlackTheme), name: NSNotification.Name(rawValue: "black_theme"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setWhiteTheme), name: NSNotification.Name(rawValue: "white_theme"), object: nil)

    }
    @objc func setBlackTheme(){
        self.favoriteTableView.backgroundColor = .black
        self.cellWhiteColor = false
        self.favoriteTableView.reloadData()
    }
    
    @objc func setWhiteTheme(){
        self.favoriteTableView.backgroundColor = .white
        self.cellWhiteColor = true
        self.favoriteTableView.reloadData()
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
        cell.backgroundColor = cellWhiteColor ? .white : .black
        cell.textLabel?.textColor = cellWhiteColor ? .black : .white
        cell.imageView?.image = record.image
        cell.imageView?.backgroundColor = .red
        cell.imageView?.layer.cornerRadius = 100.0
        cell.imageView?.clipsToBounds = true
        cell.imageView?.contentMode = .scaleAspectFill
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 3
    }
    
}
