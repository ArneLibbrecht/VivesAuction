//
//  RegistrationValidator.swift
//  VivesAuction
//
//  Created by Arne Libbrecht on 12/12/2018.
//  Copyright © 2018 Arne Libbrecht. All rights reserved.
//

import Foundation
import FirebaseAuth
class RegistrationValidator{
    static func validate(p_name:String?, p_email:String?,p_password:String?, p_passwordValidation:String?, p_birthDate:Date?, p_listener:RegistrationValidationProtocol){
        var errors:[String:String]=[String:String]()
        let name = p_name ?? ""
        let email = p_email ?? ""
        let password = p_password ?? ""
        let passwordValidation = p_passwordValidation ?? ""
        let birthDate = p_birthDate
        if( name == ""){
            errors["NameRequired"]="Het veld naam is verplicht, gelieve dit in te vullen."
        }
        if(email == ""){
            errors["EmailRequired"]="Het veld email is verplicht, gelieve dit in te vullen."
        }
        if(password == ""){
            errors["passwordRequired"]="Het veld paswoord is verplicht, gelieve dit in te vullen."
        }
        if(passwordValidation == ""){
            errors["PasswordValidationRequired"]="Het veld paswoordvalidatie is verplicht, gelieve dit in te vullen."
        }
        if(birthDate==nil) {
            errors["birthDateRequired"]="Het veld geboortedatum is verplicht, gelieve dit in te vullen."
        }
        
        if(password==passwordValidation){
            errors["wrongPasswordValidation"]="Het wachtwoord en de paswoordvalidatie moeten gelijk zijn."
        }
        
        if(errors.count==0){
            
            let logindatabag = LoginDatabag(email: email,password: password)
            Auth.auth().createUser(withEmail: logindatabag.getEmail(), password: logindatabag.getPassword()){(authResult, error) in
                guard let user = authResult?.user else {
                    errors["registrationFailed"]="De validatieregels bij Firebase werden niet voldaan."
                    p_listener.registrationCompleted(login: logindatabag, error: errors)
                    return
                }
                let memberDAO = MemberDAO()
                let member=MemberModel(uid:user.uid, name: name,birthDate:birthDate!)
                memberDAO.addMember(member: member)
                p_listener.registrationCompleted(login: logindatabag, error: errors)
            }
        }
        else{
            p_listener.registrationCompleted(login: logindatabag, error: errors)
        }
    
    }
    
}
