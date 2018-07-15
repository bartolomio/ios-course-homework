//
//  User.swift
//  09-Login
//
//  Created by Роман on 14.07.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import Foundation
import UIKit

class User {
    var name: String
    var lastName: String
    var age: Int
    var email: String
    var gender: String
    private var pass: String
    
    init(name: String, lastName: String, age: Int, email: String, gender: String, password: String) {
        self.name = name
        self.lastName = lastName
        self.age = age
        self.email = email
        self.gender = gender
        self.pass = password
    }
    
    func description() -> String {
        let result = self.name + "\n" + self.lastName + "\n" + String(self.age) + "\n" + self.email + "\n" + self.gender
        return result
    }
    
    func passIsCorrect (password: String) -> Bool {
        if password == self.pass {
            return true
        } else {
            return false
        }
    }

}
