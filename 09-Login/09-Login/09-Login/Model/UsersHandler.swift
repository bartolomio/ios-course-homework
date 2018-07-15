//
//  UsersHandler.swift
//  09-Login
//
//  Created by Роман on 15.07.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import Foundation

final class UsersHandler {
    static let shared = UsersHandler()
    private var users: [User] = [User]()
    private init() {}
    func userAlreadyExist(userToCheck: User) -> (Bool,String){
        var result = false
        var message = ""
        for user in self.users{
            if user.email == userToCheck.email {
                result = true
                message = "Email already exist"
            }
        }
        return (result,message)
    }
    
    func isUserExist(mailToCheck: String, passwordToCheck: String) -> (Bool,String){
        var result = false
        var message = ""
        for user in self.users{
            if user.email == mailToCheck {
                if user.passIsCorrect(password: passwordToCheck){
                    result = true
                    return(result,message)
                } else {
                    result = false
                    message = "Password is incorect!"
                    return(result,message)
                }
            }
        }
        message = "No such user"
        return (result,message)
    }

    func addNewUser(newUser: User) {
        self.users.append(newUser)
        print ("new user created")
        print (newUser.description())
    }
}
