//
//  ActionViewController.swift
//  04-frame_bounds
//
//  Created by Роман on 27.05.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class ActionViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    weak var delegate: ActionViewControllerDelegate?
    
    var name: String? = nil
    var tags: String? = nil
    var text: String? = nil
    var image: UIImage? = nil
    var oldRecord: Record = Record(name: nil, text: nil, tags: nil)
    var action: Action = Action.no_Action
    var deleteButtonHiden: Bool = true
    var deleteButtonEnabled: Bool = false
    let imagePicker = UIImagePickerController()
    var imageChanged: Bool = false
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var tagsTextField: UITextField!
    @IBOutlet weak var textTextField: UITextField!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    //MARK: Action View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.text = oldRecord.name
        tagsTextField.text = oldRecord.tagsAsString()
        textTextField.text = oldRecord.text
        if oldRecord.image == nil {
            photoImageView.image = #imageLiteral(resourceName: "photo-camera")
        } else {
            photoImageView.image = oldRecord.image
        }
        deleteButton.isHidden = deleteButtonHiden
        deleteButton.isEnabled = deleteButtonEnabled
        
        self.nameTextField.delegate = self
        self.tagsTextField.delegate = self
        self.textTextField.delegate = self
        // Do any additional setup after loading the view.
        self.okButton.layer.borderColor = UIColor.green.cgColor
        self.okButton.layer.borderWidth = 5.0
        self.deleteButton.layer.borderColor = UIColor.green.cgColor
        self.deleteButton.layer.borderWidth = 5.0
        
        let photoImageViewTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        self.photoImageView.addGestureRecognizer(photoImageViewTapRecognizer)
        self.photoImageView.isUserInteractionEnabled = true
        
        imagePicker.delegate = self
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
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)



    }
    
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
          imagePicker.allowsEditing = false
          imagePicker.sourceType = .camera
        
          present(imagePicker, animated: true, completion: nil)
        }
        else {
          let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
          self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallery(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have photo library", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.photoImageView.image = chosenImage
        self.imageChanged = true
        dismiss(animated:true, completion: nil)
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
        if self.imageChanged {
            image = photoImageView.image!
            print ("not default")
        } else {
            image = nil
        }
        if action == Action.add_Record {
            let newRecord = Record(name: name, text: text, tags: tags)
            newRecord.image = image
            action.performAction(delegate: delegate, record: newRecord)
            
        } else if action == Action.edit_Record {
            if (text != oldRecord.text) ||
               (name != oldRecord.name) ||
               (tags != oldRecord.tagsAsString()) ||
               self.imageChanged {
                oldRecord.name = name
                oldRecord.text = text
                if let _: String = tags {
                    oldRecord.tags = tags!.components(separatedBy: ",")
                }
                oldRecord.image = photoImageView.image!
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "record_edited"), object: nil)
            }
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onDeleteButtonTapped(_ sender: Any) {
        Action.delete_Record.performAction(delegate: delegate)
        deleteButton.isHidden = true
        deleteButton.isEnabled = false
        self.navigationController?.popViewController(animated: true)
    }
    
    func setTheme(textColor: UIColor, backgroundColor: UIColor){
        let allSubviews = self.view.subviewsRecursive()
        for view in allSubviews {
            view.backgroundColor = backgroundColor
        }
        self.nameTextField.textColor = textColor
        self.tagsTextField.textColor = textColor
        self.textTextField.textColor = textColor
        self.nameTextField.backgroundColor = (backgroundColor == .black ? .gray : .white)
        self.tagsTextField.backgroundColor = (backgroundColor == .black ? .gray : .white)
        self.textTextField.backgroundColor = (backgroundColor == .black ? .gray : .white)
        self.okButton.titleLabel?.textColor = textColor
        self.deleteButton.titleLabel?.textColor = textColor
        self.nameLabel.textColor = textColor
        self.tagsLabel.textColor = textColor
        self.textLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor

    }
    
}
//MARK: UITextFieldDelegate conforming
extension ActionViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.nameTextField.resignFirstResponder()
        self.tagsTextField.resignFirstResponder()
        self.textTextField.resignFirstResponder()
        return true
    }
}
