//
//  RecordsHandler.swift
//  06-MVP-CVC
//
//  Created by Роман on 11.06.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import Foundation

final class RecordHandler {
    static let shared = RecordHandler()
    var records: [Record] = [Record]()
    private init() {}
}
