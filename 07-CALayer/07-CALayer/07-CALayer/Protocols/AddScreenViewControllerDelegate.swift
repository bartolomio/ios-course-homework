//
//  AddScreenViewControllerDelegate.swift
//  03_CVC
//
//  Created by Роман on 01.06.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import Foundation

protocol ActionViewControllerDelegate: class {
    
    func addRecord(record:Record)
    func deleteRecord()
    
}
