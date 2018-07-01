//
//  EditInstructionViewController.swift
//  06-MVP-CVC
//
//  Created by Роман on 01.07.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class EditInstructionViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    //MARK: EditInstruction View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animatingImages = [#imageLiteral(resourceName: "editDeleteInstruction1"),#imageLiteral(resourceName: "editDeleteInstruction2")]
        self.imageView.animationImages = animatingImages
        self.imageView.animationDuration = 10.0
        self.imageView.startAnimating()
    }
}
