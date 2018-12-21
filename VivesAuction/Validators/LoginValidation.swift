//
//  LoginValidation.swift
//  Auction
//
//  Created by student on 06/12/2018.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation
import FirebaseAuth


class LoginValidation {
    static func validate(email:String, password: String, listener: LoginValidationProtocol){
        
        var error:String = ""
        if email.count == 0{
            error = "Please fill in an email!"
            listener.showError(error: error)
        }
        else if password.count == 0 {
            error = "Please fill in a password!"
            listener.showError(error: error)
        }
        else {
            listener.loginCompleted(email: email, password: password)
        }
    }
}
