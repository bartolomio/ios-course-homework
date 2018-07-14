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
    var favoriteCount: Int {
        var count = 0
        for record in self.records{
            if record.favorite{
                count = count + 1
            }
        }
        return count
    }
    var favoriteRecords: [Record] {
        var favorites = [Record]()
        for record in self.records {
            if record.favorite {
                favorites.append(record)
            }
        }
        return favorites
    }
    private init() {}
}
