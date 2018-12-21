//
//  AuctionTVC.swift
//  Auction
//
//  Created by student on 06/12/2018.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit
import FirebaseFirestore

class TableViewController: UITableViewController, ArticleProtocol, BidProtocol {
  
    var user:LoginDatabag!
    var array = [ArticleModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    
    func setLogin(login:LoginDatabag) {
        user = login
    }
    
    func ready(array: [ArticleModel]) {
        self.array = array
        self.tableView.reloadData()
        for article in array {
            BidDAO.init(prot: self).getBids(articleUid: article.getId())
        }
    }
    
    func readyBids(array: [BidModel], uid:String) {
        let index = self.array.firstIndex { articleModel -> Bool in
            return articleModel.getId() == uid
        }
        self.array[index!].setBids(bids: array)
        self.tableView.reloadRows(at: [IndexPath(row: index!, section: 0)], with: UITableView.RowAnimation(rawValue: 2)!)
    }
    
    func getData() {
        ArticleDAO.init(prot: self).getArticles()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        //!!!!
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        vc.setArticle(article: array[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //moet op accessory klikken dit is de info button op de row! roept de functie hierboven aan!!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let article = array[indexPath.row]
        
        if article.getBids().count > 0 {
            let high = getHighestBid(bids: article.getBids(), start: article.minBid)
            cell.detailTextLabel?.text = "Huidig bod: \(high)"
            cell.detailTextLabel?.textColor = UIColor.blue
        }else{
            cell.detailTextLabel?.text = "Startbedrag: \(article.getMinBid())"
            cell.detailTextLabel?.textColor = UIColor.black
        }
  
        cell.textLabel?.text = article.getDesc()
        return cell
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
