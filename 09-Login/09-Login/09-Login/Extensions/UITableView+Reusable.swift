//
//  UITableView+Reusable.swift
//  08-UICollectionView
//
//  Created by Serhii Miskiv on 7/3/18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

extension UITableView {
    func register(_ identifiers: Array<String>) {
        for identifier in identifiers {
            self .register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        }
    }
}
