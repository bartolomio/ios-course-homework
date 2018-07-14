//
//  SettingsViewController.swift
//  06-MVP-CVC
//
//  Created by Роман on 11.06.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    //@IBOutlet var view: UIView!
    
    @IBOutlet weak var blackThemeLabel: UILabel!
    @IBOutlet weak var settingsLable: UILabel!
    @IBOutlet weak var blackThemeSwitcher: UISwitch!
    @IBOutlet weak var gridViewSwitcher: UISwitch!
    @IBOutlet weak var gridViewLabel: UILabel!
    
    //MARK: Settings View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Settings.shared.isBlackTheme() ? setTheme(textColor: .white, backgroundColor: .black) : setTheme(textColor: .black, backgroundColor: .white)
        NotificationCenter.default.addObserver(self, selector: #selector(setBlackTheme), name: NSNotification.Name(rawValue: "black_theme"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setWhiteTheme), name: NSNotification.Name(rawValue: "white_theme"), object: nil)

    }
    @objc func setBlackTheme(){
        setTheme(textColor: .white, backgroundColor: .black)
    }
    @objc func setWhiteTheme(){
        setTheme(textColor: .black, backgroundColor: .white)
    }
    
    func setTheme(textColor: UIColor, backgroundColor: UIColor){
        let allSubviews = self.view.subviewsRecursive()
        for view in allSubviews {
            if view.tag != 255 {
              view.backgroundColor = backgroundColor
            }
        }
        self.view.backgroundColor = backgroundColor
        self.settingsLable.textColor = textColor
        self.blackThemeLabel.textColor = textColor
        self.blackThemeSwitcher.onTintColor = .green
        self.blackThemeSwitcher.tintColor = .gray
        self.gridViewLabel.textColor = textColor
        self.gridViewSwitcher.onTintColor = .green
        self.gridViewSwitcher.tintColor = .gray
        
    }
    @IBAction func onGridViewSwitcherTapped(_ sender: Any) {
        gridViewSwitcher.isOn ? Settings.shared.collectionView() : Settings.shared.tableView()
    }
    
    @IBAction func onBlackThemeSwitcherTapped(_ sender: Any) {
        blackThemeSwitcher.isOn ? Settings.shared.blackTheme() : Settings.shared.whiteTheme()
    }
}
