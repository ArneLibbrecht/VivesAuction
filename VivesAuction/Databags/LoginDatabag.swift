//
//  LoginDatabag.swift
//  VivesAuction
//
//  Created by Arne Libbrecht on 12/12/2018.
//  Copyright © 2018 Arne Libbrecht. All rights reserved.
//

import Foundation

class LoginDatabag{
    var email:String
    var password:String
    
    init(email:String,password:String){
        self.email=email
        self.password=password
    }
    
    func getEmail() -> String {
        return self.email
    }

    func getPassword() -> String{
        return self.password
    }
    
}
