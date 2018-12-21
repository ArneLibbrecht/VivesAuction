//
//  ArticleModel.swift
//  Auction
//
//  Created by student on 06/12/2018.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation

class ArticleModel {
    
    var id:String!
    var bids:[BidModel]!
    var description:String!
    var minBid:Double!
    
    init(id:String, bids:[BidModel], description:String, minBid:Double){
        self.id = id
        self.bids = bids
        self.description = description
        self.minBid = minBid
    }
    
    public func getId() -> String {
        return id
    }
    
    public func getBids() -> [BidModel] {
        return bids
    }
    
    public func getDesc() -> String {
        return description
    }
    
    public func getMinBid() -> Double {
        return minBid
    }
    
    public func setBids(bids:[BidModel]) {
        self.bids = bids
    }
}
