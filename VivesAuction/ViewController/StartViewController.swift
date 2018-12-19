//
//  ViewController.swift
//  VivesAuction
//
//  Created by Arne Libbrecht on 28/11/2018.
//  Copyright © 2018 Arne Libbrecht. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden=true
    }

}
