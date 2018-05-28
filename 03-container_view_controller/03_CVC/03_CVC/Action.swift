//
//  Action.swift
//  03_CVC
//
//  Created by Роман on 24.05.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import Foundation

enum Action{
    case no_Action
    case add_Record
    case edit_Record
    case delete_Record

    func performAction(delegate:AddScreenViewControllerDelegate?, record:Record? = nil){
        switch self {
            case .add_Record:
                delegate?.addRecord(record: record!)
            
            case .edit_Record:
                delegate?.updateRecord(record: record!)
            
            case .delete_Record:
                delegate?.deleteRecord()
            
            default:break // you can implement .no_Action case instead of "default", but this is optional
        }
    }
}
