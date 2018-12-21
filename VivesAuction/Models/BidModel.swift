//
//  BidModel.swift
//  Auction
//
//  Created by student on 06/12/2018.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation

class BidModel {
    
    var amount:Double!
    var date:Date!
    
    init(amount:Double, date:Date){
        self.amount = amount
        self.date = date
    }
    
    public func getAmount() -> Double {
        return amount
    }
    
    public func getDate() -> Date {
        return date
    }

}
