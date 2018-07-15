//
//  LoginViewController.swift
//  09-Login
//
//  Created by Роман on 15.07.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!

    @IBOutlet weak var proceedButtonParentView: UIView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var proceedButton: UIButton!
    var loginAllowed = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onProceedButtonTapped(_ sender: Any) {
        var result: Bool
        var message: String
        if loginAllowed {
            self.loginAllowed = false
            self.performSegue(withIdentifier: "toRecordList", sender: self)
        } else {
            if emailField.text == "" {
                let alert  = UIAlertController(title: "Warning", message: "Please, enter your email", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else if passwordField.text == "" {
                let alert  = UIAlertController(title: "Warning", message: "Please, enter your password", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                (result,message) = UsersHandler.shared.isUserExist(mailToCheck: emailField.text!, passwordToCheck: passwordField.text!)
                if result {
                    print ("USER EXIST")
                    let buttonWidth = self.proceedButton.bounds.width
                    let buttonHeight = self.proceedButton.bounds.height
                    let newSize = CGSize(width: buttonWidth * 1.7, height: buttonHeight * 1.2)
                    UIView.animate(withDuration: 0.5){
                        self.proceedButton.bounds.size = newSize
                        self.proceedButton.setTitle("Login Successful", for: .normal)
                        self.proceedButton.backgroundColor = .green
                        self.proceedButtonParentView.layoutIfNeeded()
                    }
                    self.loginAllowed = true
                } else {
                    let alert  = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }

    }
}

//MARK: UITextFieldDelegate conforming
extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.emailField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
        return true
    }
}
