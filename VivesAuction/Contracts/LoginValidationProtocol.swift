//
//  LoginValidationProtocol.swift
//  VivesAuction
//
//  Created by Arne Libbrecht on 21/12/2018.
//  Copyright © 2018 Arne Libbrecht. All rights reserved.
//

import Foundation
protocol LoginValidationProtocol {
    func loginCompleted(email:String, password:String)
    func showError(error:String)
}
