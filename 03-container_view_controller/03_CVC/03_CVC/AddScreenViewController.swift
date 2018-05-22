//
//  AddScreenViewController.swift
//  03_CVC
//
//  Created by Роман on 22.05.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class AddScreenViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var tagsLabel: UITextField!
    @IBOutlet weak var textLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onOkButton(_ sender: Any) {
        let record = Record(name: nameLabel.text, text: textLabel.text, tags: tagsLabel.text)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
