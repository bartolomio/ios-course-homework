//
//  Settings.swift
//  08-UICollectionView
//
//  Created by Роман on 02.07.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import Foundation

final class Settings{
    static let shared = Settings()
    private var blackThemeIsOn = false
    private init() {}
    func blackTheme(){
        self.blackThemeIsOn = true
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "black_theme"), object: nil)
    }
    func whiteTheme(){
        self.blackThemeIsOn = false
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "white_theme"), object: nil)
    }
    func isBlackTheme() -> Bool {
        return blackThemeIsOn
    }
}
