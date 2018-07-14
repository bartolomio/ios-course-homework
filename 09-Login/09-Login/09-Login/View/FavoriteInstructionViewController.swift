//
//  FavoriteInstructionViewController.swift
//  06-MVP-CVC
//
//  Created by Роман on 01.07.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class FavoriteInstructionViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    //MARK: FavoriteInstruction View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animatingImages = [#imageLiteral(resourceName: "favoriteInstruction")]
        self.imageView.animationImages = animatingImages
        self.imageView.animationDuration = 10.0
        self.imageView.startAnimating()
        self.nextButton.layer.borderWidth = 5.0
        self.nextButton.layer.borderColor = UIColor.red.cgColor
    }
}
