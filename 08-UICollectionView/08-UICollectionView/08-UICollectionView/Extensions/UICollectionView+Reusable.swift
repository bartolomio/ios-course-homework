//
//  UICollectionView+Reusable.swift
//  08-UICollectionView
//
//  Created by Роман on 11.07.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register(_ identifiers: Array<String>) {
        for identifier in identifiers {
            self .register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
        }
    }
}
