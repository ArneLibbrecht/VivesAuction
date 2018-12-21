//
//  ArticleDAO.swift
//  Auction
//
//  Created by student on 06/12/2018.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation

import Foundation
import FirebaseFirestore

protocol ArticleProtocol {
    func ready(array:[ArticleModel])
}

class ArticleDAO {
    
    var db:Firestore?
    var articleProtocol:ArticleProtocol
    
    init(prot:ArticleProtocol) {
        db = Firestore.firestore()
        articleProtocol = prot
    }
    
    func getArticles() {
      
        db!.collection("Article").addSnapshotListener { querySnapshot, err in
            var articles = [ArticleModel]()
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    var minBid:Double = 0.0
                    let number:CFNumber = document.data()["minBid"] as! CFNumber
                    var bidFloat:Float = 0
                    if CFNumberGetValue(number, CFNumberType.floatType, &bidFloat) {
                        minBid = Double(bidFloat)
                    }
                    let desc:String = document.data()["description"] as! String
                    let bids:[BidModel] = []
                    let article = ArticleModel(id: document.documentID, bids: bids, description: desc, minBid: minBid)
                    articles.append(article)
                }
            }
            self.articleProtocol.ready(array: articles)
        }
    }
}
