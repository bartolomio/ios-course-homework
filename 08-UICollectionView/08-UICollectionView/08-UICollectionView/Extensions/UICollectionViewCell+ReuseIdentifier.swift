//
//  UICollectionViewCell+ReuseIdentifier.swift
//  08-UICollectionView
//
//  Created by Роман on 11.07.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
