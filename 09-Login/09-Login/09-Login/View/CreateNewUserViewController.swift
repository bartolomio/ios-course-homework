//
//  CreateNewUserViewController.swift
//  09-Login
//
//  Created by Роман on 15.07.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class CreateNewUserViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var secondNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var genderPicker: UIPickerView!
    
    @IBOutlet weak var agePicker: UIPickerView!
    let gender:[String] = ["male","female","it"]
    let myRange: CountableRange = 1..<101
    var ages:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in myRange {
            ages.append(index)
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func onRegisterButtonTapped(_ sender: Any) {
        if nameField.text == "" {
            let alert  = UIAlertController(title: "Warning", message: "Please, enter your name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else if secondNameField.text == "" {
            let alert  = UIAlertController(title: "Warning", message: "Please, enter your second name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else if emailField.text == "" {
            let alert  = UIAlertController(title: "Warning", message: "Please, enter your email", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let newUser = User(name: nameField.text!, lastName: secondNameField.text!, age: agePicker.selectedRow(inComponent: 0) + 1, email: emailField.text!, gender: gender[genderPicker.selectedRow(inComponent: 0)])
            print (newUser.description())
        }
    }
}

extension CreateNewUserViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return gender.count
        }
        return ages.count

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return gender[row]
        }
        return String(ages[row])
        
    }
}
//MARK: UITextFieldDelegate conforming
extension CreateNewUserViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.nameField.resignFirstResponder()
        self.secondNameField.resignFirstResponder()
        self.emailField.resignFirstResponder()
        return true
    }
}
