//
//  MemberModel.swift
//  VivesAuction
//
//  Created by Arne Libbrecht on 19/12/2018.
//  Copyright © 2018 Arne Libbrecht. All rights reserved.
//

import Foundation
class MemberModel{
    var uid:String=""
    var name:String=""
    var birthDate:Date=Date()
    
    init(uid:String,name:String,birthDate:Date) {
        setUid(uid:uid)
        setName(name:name)
        setBirthDate(birthDate:birthDate)
    }
    
    func getUid() -> String{
        return uid
    }
    func getName() -> String{
        return name    }
    func getBirthDate() -> Date{
        return birthDate
    }
    
    func setUid(uid:String) -> Void{
        self.uid=uid
    }
    func setName(name:String) -> Void{
       self.name=name    }
    func setBirthDate(birthDate:Date) -> Void{
        self.birthDate=birthDate
    }
    
}
