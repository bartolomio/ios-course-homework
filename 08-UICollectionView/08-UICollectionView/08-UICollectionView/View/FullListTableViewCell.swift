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
    
    func set(with record: Record) {
        //Set all proper data needed directly into the outlets
        
    }
}
