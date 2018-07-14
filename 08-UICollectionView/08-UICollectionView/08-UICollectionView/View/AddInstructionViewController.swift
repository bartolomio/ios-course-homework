//
//  AddInstructionViewController.swift
//  06-MVP-CVC
//
//  Created by Роман on 01.07.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class AddInstructionViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    //MARK: AddInstruction View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        let animatingImages = [#imageLiteral(resourceName: "addInstruction1"),#imageLiteral(resourceName: "addInsrtuction2")]
        self.imageView.animationImages = animatingImages
        self.imageView.animationDuration = 10.0
        self.imageView.startAnimating()
    }
}
