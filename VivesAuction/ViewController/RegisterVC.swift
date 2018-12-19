//
//  RegisterVC.swift
//  VivesAuction
//
//  Created by Arne Libbrecht on 06/12/2018.
//  Copyright © 2018 Arne Libbrecht. All rights reserved.
//

import UIKit
class RegisterVC: UIViewController,RegistrationValidationProtocol {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtRepeatPassword: UITextField!
    @IBOutlet weak var dtpBirthdate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden=false
    }
    
    
    
    @IBAction func registerClicked(_ sender: Any) {

       RegistrationValidator.validate(p_name: txtName.text, p_email: txtMail.text, p_password: txtPassword.text, p_passwordValidation: txtRepeatPassword.text, p_birthDate: dtpBirthdate.date, p_listener: self)
        
        
    }
    func registrationCompleted(login: LoginDatabag?, error: [String : String]) {
        if(error.count==0){
            
        }else{
            var message=""
            error.forEach { err in
                message = message + err.value + "\n"
            }
            let alert = UIAlertController(title:"fout bij invoer", message:message,preferredStyle: .alert)
            self.present(alert, animated: true)
        }
    }
    
    
}
