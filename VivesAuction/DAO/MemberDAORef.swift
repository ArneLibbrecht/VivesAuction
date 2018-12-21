//
//  MemberDAORef.swift
//  Auction
//
//  Created by student on 19/12/2018.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol MemberRefProtocol {
    func readyMemberRef(ref:String)
}

class MemberDAORef {
    
    var db:Firestore?
    var memberRefProtocol:MemberRefProtocol
    
    init(prot:MemberRefProtocol) {
        db = Firestore.firestore()
        memberRefProtocol = prot
    }
    
    func getMemberRef(uid:String) {
        var ref:String = "DefRef"
        db!.collection("Member").whereField("uid", isEqualTo: uid).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    ref = document.documentID
                }
            }
            self.memberRefProtocol.readyMemberRef(ref: ref)
        }
    }
}
