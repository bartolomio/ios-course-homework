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
        
        Settings.shared.isBlackTheme() ? setTheme(textColor: .white, backgroundColor: .black) : setTheme(textColor: .black, backgroundColor: .white)
        NotificationCenter.default.addObserver(self, selector: #selector(setBlackTheme), name: NSNotification.Name(rawValue: "black_theme"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setWhiteTheme), name: NSNotification.Name(rawValue: "white_theme"), object: nil)
        
        favoriteTableView.register([FullListTableViewCell.reuseIdentifier])

    }
    @objc func setBlackTheme(){
        setTheme(textColor: .white, backgroundColor: .black)
    }
    @objc func setWhiteTheme(){
        setTheme(textColor: .black, backgroundColor: .white)
    }
    override func viewDidAppear(_ animated: Bool) {
        self.favoriteTableView.reloadData()
    }
    
    func setTheme(textColor: UIColor, backgroundColor: UIColor){
        let allSubviews = self.view.subviewsRecursive()
        for view in allSubviews {
            view.backgroundColor = backgroundColor
        }
        self.view.backgroundColor = backgroundColor
    }

}

//MARK: UITableViewDelegate and UITableViewDataSource conforming
extension FuturedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecordHandler.shared.favoriteRecords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let record = RecordHandler.shared.favoriteRecords[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FullListTableViewCell.reuseIdentifier, for: indexPath) as! FullListTableViewCell
        cell.set(with: record, isBlack: Settings.shared.isBlackTheme())
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 3
    }
    
}
