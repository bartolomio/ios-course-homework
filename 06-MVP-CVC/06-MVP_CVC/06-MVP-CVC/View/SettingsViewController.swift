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
    //MARK: Settings View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onBlackThemeSwitcherTapped(_ sender: Any) {
        
        self.view.backgroundColor = blackThemeSwitcher.isOn ? .black : .white
        self.blackThemeLabel.textColor = blackThemeSwitcher.isOn ? .white : .black
        self.settingsLable.textColor = blackThemeSwitcher.isOn ? .white : .black
        if blackThemeSwitcher.isOn {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "black_theme"), object: nil)
        } else {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "white_theme"), object: nil)
        }
    }
}
