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
    
    init(name: String, lastName: String, age: Int, email: String, gender: String) {
        self.name = name
        self.lastName = lastName
        self.age = age
        self.email = email
        self.gender = gender
    }
    
    func description() -> String {
        let result = self.name + "\n" + self.lastName + "\n" + String(self.age) + "\n" + self.email + "\n" + self.gender
        return result
    }

}
