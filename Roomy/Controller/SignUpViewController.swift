//
//  SignUpViewController.swift
//  Roomy
//
//  Created by Mahmoud on 4/8/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    
    //MARK:- IBOutlets
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helper()
    }
    
    
    //MARK:- Helpers
    func helper(){
        buttonShape()
        EmailTextField.underlined()
        userNameTextField.underlined()
        passwordTextField.underlined()
        hideKeyboardWhenTappedAround()
    }
    
    
    //MARK:-IBActions
    @IBAction func signUpPressed(_ sender: Any) {
        let email = EmailTextField.text
        let username = userNameTextField.text
        let password = passwordTextField.text
               // check for empty fields
        if email!.isEmpty || username!.isEmpty || password!.isEmpty{
        displayAlertMessage(userMessage: "All fields are required")
        }else{
            //SignUp
        }
               
               
                
  }
               
               
        
    
    
    
    
    
    //MARK: - SignUp Button Customization
     func buttonShape(){
         signUpButton.layer.borderColor = signUpButton.backgroundColor?.cgColor
         signUpButton.layer.borderWidth  = 1.0
         signUpButton.layer.cornerRadius = 30.0
     }
    
    //MARK:- Alert Message
    private func displayAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title: userMessage, message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert,animated: true)
    }

}
