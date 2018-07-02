//
//  UITableViewCell+ReuseIdentifier.swift
//  08-UICollectionView
//
//  Created by Serhii Miskiv on 7/3/18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
