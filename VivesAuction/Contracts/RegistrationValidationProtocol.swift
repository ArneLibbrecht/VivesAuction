//
//  RegistrationValidationProtocol.swift
//  VivesAuction
//
//  Created by Arne Libbrecht on 12/12/2018.
//  Copyright © 2018 Arne Libbrecht. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth


protocol RegistrationValidationProtocol {
    func registrationCompleted(login:LoginDatabag?, error: [String:String])
}
