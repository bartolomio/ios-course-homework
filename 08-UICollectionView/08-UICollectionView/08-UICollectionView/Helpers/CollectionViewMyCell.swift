//
//  CollectionViewCell.swift
//  08-UICollectionView
//
//  Created by Роман on 11.07.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class CollectionViewMyCell: UICollectionViewCell {

    @IBOutlet weak var recordImageView: UIImageView!
    @IBOutlet weak var recordTagsLabel: UILabel!
    @IBOutlet weak var recordTextLabel: UILabel!
    @IBOutlet weak var recordDateLabel: UILabel!
    @IBOutlet weak var recordNameLabel: UILabel!
    
    
    func set(with record: Record, isBlack: Bool) {
        //Set all proper data needed directly into the outlets
        if record.image == nil {
            self.recordImageView.image = #imageLiteral(resourceName: "photo-camera")
        } else {
            self.recordImageView.image = record.image
            self.recordImageView.layer.cornerRadius = self.recordImageView.frame.width/2
            self.recordImageView.clipsToBounds = true
        }
        
        self.recordDateLabel.text = record.datetoString()
        self.recordNameLabel.text = record.text
        self.recordTagsLabel.text = record.tagsAsString()
        self.recordTextLabel.text = record.text
        
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
    func setTheme(textColor: UIColor, backgroundColor: UIColor){
        let allSubviews = self.subviewsRecursive()
        for view in allSubviews {
            view.backgroundColor = backgroundColor
        }
        self.backgroundColor = backgroundColor
        self.recordDateLabel.textColor = textColor
        self.recordNameLabel.textColor = textColor
        self.recordTextLabel.textColor = textColor
        self.recordTagsLabel.textColor = textColor
    }

}
