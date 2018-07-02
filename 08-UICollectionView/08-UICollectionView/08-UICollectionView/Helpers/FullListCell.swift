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
    
    let customImageView = UIImageView(image: #imageLiteral(resourceName: "addInstruction1"))
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let cellCheckButton = UIButton(type: .system)
        cellCheckButton.setImage(#imageLiteral(resourceName: "star"), for: .normal)
        cellCheckButton.tintColor = starColor
        cellCheckButton.frame = CGRect(x: 0, y: 0, width: self.frame.width / 5.0 , height: self.frame.height)
        cellCheckButton.addTarget(self, action: #selector(onStarClicked), for: .touchUpInside)
        accessoryView = cellCheckButton
        
        self.customImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(customImageView)

        self.customImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0).isActive = true
        self.customImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.customImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
        self.customImageView.clipsToBounds = true
        self.customImageView.contentMode = .scaleAspectFill
        
    }
    
    @objc func onStarClicked(){
        viewController?.handeFavoriteClick(cell: self)

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
