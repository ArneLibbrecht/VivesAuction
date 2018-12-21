//
//  MemberDAOget.swift
//  Auction
//
//  Created by student on 19/12/2018.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol MemberProtocol {
    func readyMember(names:[String])
}

class MemberDAOget {
    
    var db:Firestore?
    var memberProtocol:MemberProtocol
    
    init(prot:MemberProtocol) {
        db = Firestore.firestore()
        memberProtocol = prot
    }
    
    func getMemberName(uid:String) {
        var names = [String]()
        db!.collection("Member").whereField("uid", isEqualTo: uid).getDocuments() { (querySnapshot, err) in
            
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data()["name"] as! String)")
                    names.append(document.data()["name"] as! String)
                }
            }
            self.memberProtocol.readyMember(names: names)
        }
    }
}
