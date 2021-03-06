//
//  FullListTableViewCell.swift
//  08-UICollectionView
//
//  Created by Serhii Miskiv on 7/3/18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class FullListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recordImage: UIImageView!
    @IBOutlet weak var recordName: UILabel!
    @IBOutlet weak var recordHashtags: UILabel!
    @IBOutlet weak var recordDate: UILabel!
    @IBOutlet weak var recordText: UILabel!
    
    func set(with record: Record, isBlack: Bool) {
        //Set all proper data needed directly into the outlets
        if record.image == nil {
            self.recordImage.image = #imageLiteral(resourceName: "photo-camera")
        } else {
            self.recordImage.image = record.image
            self.recordImage.layer.cornerRadius = self.recordImage.frame.width/2
            self.recordImage.clipsToBounds = true
        }

        self.recordDate.text = record.datetoString()
        self.recordName.text = record.text
        self.recordHashtags.text = record.tagsAsString()
        self.recordText.text = record.text
        
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
        self.recordDate.textColor = textColor
        self.recordName.textColor = textColor
        self.recordText.textColor = textColor
        self.recordHashtags.textColor = textColor
    }
}
