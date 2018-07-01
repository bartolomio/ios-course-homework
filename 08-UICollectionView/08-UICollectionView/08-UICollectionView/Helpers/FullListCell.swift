//
//  FullListCell.swift
//  06-MVP-CVC
//
//  Created by Роман on 13.06.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class FullListCell: UITableViewCell {
    
    var viewController: FullListViewController?
    
    var starColor : UIColor = UIColor.gray
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let cellCheckButton = UIButton(type: .system)
        cellCheckButton.setImage(#imageLiteral(resourceName: "star"), for: .normal)
        cellCheckButton.tintColor = starColor
        cellCheckButton.frame = CGRect(x: 0, y: 0, width: self.frame.width / 5.0 , height: self.frame.height)
        cellCheckButton.addTarget(self, action: #selector(onStarClicked), for: .touchUpInside)
        accessoryView = cellCheckButton
        self.imageView?.image = #imageLiteral(resourceName: "photo-camera")
        self.imageView?.layer.cornerRadius = 100.0
        self.imageView?.backgroundColor = .red
        self.imageView?.contentMode = .scaleAspectFill
        self.imageView?.clipsToBounds = true
    }
    
    @objc func onStarClicked(){
        viewController?.handeFavoriteClick(cell: self)

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
