//
//  BidDAOadd.swift
//  Auction
//
//  Created by student on 19/12/2018.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation

import FirebaseFirestore
import FirebaseAuth


class BidDAOadd {
    
    var db:Firestore?
    
    init() {
        db = Firestore.firestore()
    }
    
    func addBidForArticle(article:ArticleModel, bid:BidModel, ref:String) {
        db!.collection("Article").document(article.getId()).collection("Bid").addDocument(data: [
            "Amount": bid.getAmount(),
            "Date": bid.getDate(),
            "Uid": ref
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added!")
            }
        }
    }
}
