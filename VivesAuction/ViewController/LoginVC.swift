//
//  LoginVC.swift
//  VivesAuction
//
//  Created by Arne Libbrecht on 06/12/2018.
//  Copyright © 2018 Arne Libbrecht. All rights reserved.
//

import UIKit
import FirebaseAuth
class LoginVC: UIViewController, LoginValidationProtocol {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden=false
    }
    @IBAction func loginClicked(_ sender: Any) {
        LoginValidation.validate(email: email.text!, password: password.text!, listener: self)
    }
    
    func loginCompleted(email:String, password:String) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                self.showError(error: error!.localizedDescription)
            }else{
                let login:LoginDatabag = LoginDatabag(email: email, password: password, uid: authResult!.user.uid)
                self.navigateToTableView(login: login)
            }
        }
    }
    
    func navigateToTableView(login: LoginDatabag) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tvArticles") as! TableViewController
        vc.setLogin(login: login)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showError(error: String) {
        let alert = UIAlertController(title: "Fout bij het inlogen", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
