//
//  ActionViewController.swift
//  04-frame_bounds
//
//  Created by Роман on 27.05.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class ActionViewController: UIViewController {
    
    weak var delegate: ActionViewControllerDelegate?
    
    var name: String? = nil
    var tags: String? = nil
    var text: String? = nil
    var action: Action = Action.no_Action
    var deleteButtonHiden: Bool = true
    var deleteButtonEnabled: Bool = false
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var tagsTextField: UITextField!
    @IBOutlet weak var textTextField: UITextField!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    //MARK: please :)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.text = name
        tagsTextField.text = tags
        textTextField.text = text
        deleteButton.isHidden = deleteButtonHiden
        deleteButton.isEnabled = deleteButtonEnabled
        
        self.nameTextField.delegate = self
        self.tagsTextField.delegate = self
        self.textTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onOkButtonTapped(_ sender: Any) {
        if nameTextField.text != ""{
            name = nameTextField.text
        } else {
            name = nil
        }
        if textTextField.text != ""{
            text = textTextField.text
        } else {
            text = nil
        }
        if tagsTextField.text != ""{
            tags = tagsTextField.text
        } else {
            tags = nil
        }
        let record = Record(name: name, text: text, tags: tags)
        action.performAction(delegate: delegate, record: record)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onDeleteButtonTapped(_ sender: Any) {
        Action.delete_Record.performAction(delegate: delegate)
        deleteButton.isHidden = true
        deleteButton.isEnabled = false
        self.navigationController?.popViewController(animated: true)
    }
}

extension ActionViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.nameTextField.resignFirstResponder()
        self.tagsTextField.resignFirstResponder()
        self.textTextField.resignFirstResponder()
        return true
    }
}
