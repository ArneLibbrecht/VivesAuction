//
//  LoginVC.swift
//  VivesAuction
//
//  Created by Arne Libbrecht on 06/12/2018.
//  Copyright © 2018 Arne Libbrecht. All rights reserved.
//

import UIKit
class LoginVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden=false
    }
    
}
