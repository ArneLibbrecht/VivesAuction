//
//  DetailViewController.swift
//  Auction
//
//  Created by student on 13/12/2018.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit
import FirebaseAuth

class DetailViewController: UIViewController, MemberProtocol, MemberRefProtocol {

    @IBOutlet weak var welkom: UILabel!
    @IBOutlet weak var min: UILabel!
    @IBOutlet weak var descrip: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var bidamount: UILabel!
    @IBOutlet weak var high: UILabel!
    var currentbiduser:Double!
    var article:ArticleModel!
    var memberName:String!
    var memberRef:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MemberDAOget.init(prot: self).getMemberName(uid: Auth.auth().currentUser!.uid)
        MemberDAORef.init(prot: self).getMemberRef(uid: Auth.auth().currentUser!.uid)
        stepper.minimumValue = getHighestBid(bids: article.getBids(), start: article.getMinBid()) + 20.0
        stepper.value = getHighestBid(bids: article.getBids(), start: article.getMinBid()) + 20.0
        bidamount.text = String(getHighestBid(bids: article.getBids(), start: article.getMinBid()) + 20.0)
        stepper!.autorepeat = true
        stepper!.wraps = true
        currentbiduser = 0.0
    }
    
    func setArticle(article:ArticleModel){
        self.article = article
    }
    
    func readyMember(names: [String]) {
        memberName = names.first
    }
    
    func readyMemberRef(ref: String) {
        memberRef = ref
        fillInData()
    }
    
    func fillInData(){
        print("----------------------------------")
        print(memberName!)
        print(memberRef!)
        welkom.text = memberName
        descrip.text = article.getDesc()
        min.text = "Minimum bod: \(String(article.getMinBid()))"
        high.text = "Huidig bod: \(String(getHighestBid(bids: article.getBids(), start: article.getMinBid())))"
    }

    @IBAction func clickedPlusMinus(_ sender: UIStepper) {
        bidamount.text = "\(Double(sender.value))"
        currentbiduser = Double(sender.value)
    }
    
    @IBAction func addBidClick(_ sender: Any) {
        let bid:BidModel = BidModel.init(amount: currentbiduser!, date: Date())
        BidDAOadd.init().addBidForArticle(article: article, bid: bid, ref: memberRef)
        self.navigationController?.popViewController(animated: true)
    }
    
    func getHighestBid(bids:[BidModel], start:Double) -> Double {
        var high = start
        for bid in bids {
            if bid.getAmount() > high {
                high = bid.getAmount()
            }
        }
        return high
    }
}

