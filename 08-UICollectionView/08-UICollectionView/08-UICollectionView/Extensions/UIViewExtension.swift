//
//  UIViewExtension.swift
//  08-UICollectionView
//
//  Created by Роман on 04.07.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit
extension UIView {
    
    func subviewsRecursive() -> [UIView] {
        return subviews + subviews.flatMap { $0.subviewsRecursive() }
    }
    
}
