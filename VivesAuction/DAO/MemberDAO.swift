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
    func addMember(member:MemberModel){
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        ref = db.collection("Member").addDocument(data: [
            "birthdate": member.getBirthDate(),
            "name":member.getName(),
            "uid":member.getUid()]){
                err in
                if let err = err {
                    print("Error adding document: \(err)")
                }
                else{
                    print("Document added \(ref!.documentID)")
                }
        }
    }
}
