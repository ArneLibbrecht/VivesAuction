//
//  MemberDAO.swift
//  VivesAuction
//
//  Created by Arne Libbrecht on 19/12/2018.
//  Copyright © 2018 Arne Libbrecht. All rights reserved.
//

import Firebase
import FirebaseFirestore
class MemberDAO{
    var db:Firestore?
    init(){
        db=Firestore.firestore()
    }
    
    func addMember(member:MemberModel){
        //let db = Firestore.firestore()
        //ar ref: DocumentReference? = nil
        db!.collection("Member").addDocument(data: [
            "birthdate": member.getBirthDate(),
            "name":member.getName(),
            "uid":member.getUid()]){
                err in
                if let err = err {
                    print("Error adding document: \(err)")
                }
                else{
                    print("Document added \(member.getName())")
                }
        }
    }
}
