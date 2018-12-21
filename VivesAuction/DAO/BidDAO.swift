//
//  BidDAO.swift
//  Auction
//
//  Created by student on 13/12/2018.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation

import Foundation
import FirebaseFirestore

protocol BidProtocol {
    func readyBids(array:[BidModel], uid:String)
}

class BidDAO {
    
    var db:Firestore?
    var bidProtocol:BidProtocol
    
    init(prot:BidProtocol) {
        db = Firestore.firestore()
        bidProtocol = prot
    }
    
    func getBids(articleUid:String) {
        db!.collection("Article").document(articleUid).collection("Bid").addSnapshotListener { querySnapshot, error in
            var bids = [BidModel]()
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    var amount:Double = 0.0
                    let amountNumber:CFNumber = document.data()["Amount"] as! CFNumber
                    var amountFloat:Float = 0
                    if CFNumberGetValue(amountNumber, CFNumberType.floatType, &amountFloat) {
                        amount = Double(amountFloat)
                    }
                    let date = document.data()["Date"] as! Date
                    let bid = BidModel(amount: amount, date: date)
                    bids.append(bid)
                }
            }
            self.bidProtocol.readyBids(array: bids, uid: articleUid)
        }
    }
}
