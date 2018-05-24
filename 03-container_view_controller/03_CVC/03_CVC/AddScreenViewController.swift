//
//  AddScreenViewController.swift
//  03_CVC
//
//  Created by Роман on 22.05.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

protocol AddScreenViewControllerDelegate: class {
    
    func addRecord(record:Record)
    func updateRecord(record:Record)
    func deleteRecord()
    
}

class AddScreenViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var tagsLabel: UITextField!
    @IBOutlet weak var textLabel: UITextField!
    @IBOutlet weak var deleteButton: UIButton!
    
    weak var delegate: AddScreenViewControllerDelegate?
    
    var name: String? = nil
    var tags: String? = nil
    var text: String? = nil
    var action: Action = Action.no_Action
    var deleteButtonHiden: Bool = true
    var deleteButtonEnabled: Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = name
        tagsLabel.text = tags
        textLabel.text = text
        deleteButton.isHidden = deleteButtonHiden
        deleteButton.isEnabled = deleteButtonEnabled
        
        self.nameLabel.delegate = self
        self.tagsLabel.delegate = self
        self.textLabel.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onOkButton(_ sender: Any) {
        if nameLabel.text != ""{
            name = nameLabel.text
        } else {
            name = nil
        }
        if textLabel.text != ""{
            text = textLabel.text
        } else {
            text = nil
        }
        if tagsLabel.text != ""{
            tags = tagsLabel.text
        } else {
            tags = nil
        }
        let record = Record(name: name, text: text, tags: tags)
        action.performAction(delegate: delegate, record: record)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func onDeleteButton(_ sender: Any) {
        
        //delegate?.deleteRecord()
        Action.delete_Record.performAction(delegate: delegate)
        deleteButton.isHidden = true
        deleteButton.isEnabled = false
        self.dismiss(animated: true, completion: nil)
        
    }
    

}

extension AddScreenViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.nameLabel.resignFirstResponder()
        self.tagsLabel.resignFirstResponder()
        self.textLabel.resignFirstResponder()
        return true
    }
}
