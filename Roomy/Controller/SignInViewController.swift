//
//  SignInViewController.swift
//  Roomy
//
//  Created by Mahmoud on 3/9/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import UIKit
protocol DissmissView {
    func dismiss()
}

class SignInViewController: UIViewController {
    
    
    
    
    //MARK:- Outlets
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    var auth_Key:Auth?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LogIn.signIn(email: "mahmoud@gmail.com", password: "12345678") {auth,error in
            self.auth_Key = auth
            
            DispatchQueue.main.async {
                
                
                self.performSegue(withIdentifier: "logInToHome", sender: auth)
            }
        }
        buttonShape()
        userNameTextField.underlined()
        passwordTextField.underlined()
        self.hideKeyboardWhenTappedAround()
        
    }
    
    // MARK:- IBAction
    @IBAction func signInPressed(_ sender: Any) {
        let username = userNameTextField.text
        let password = passwordTextField.text
        
        // check for empty fields
        
        switch (username != nil) || (password != nil) {
        //Show Alert
        case username!.isEmpty && password!.isEmpty: displayAlertMessage(userMessage: "Enter Username and Password")
        case username?.isEmpty: displayAlertMessage(userMessage: "Enter Username")
        case password?.isEmpty: displayAlertMessage(userMessage: "Enter Password")
            
            
        default: LogIn.signIn(email: username!, password: password!, completionHandler: self.handelLogIn(sender:error:))
        
        
            return
        }
        
        
        
        
        
        
    }
    
    //MARK: - handel logIn
    func handelLogIn(sender:Auth?,error:Error?){
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "logInToHome", sender: sender)
        }
    }
    
    
    //MARK: - SignIn Button Customization
    func buttonShape(){
        
        signInButton.layer.borderColor = signInButton.backgroundColor?.cgColor
        signInButton.layer.borderWidth  = 1.0
        signInButton.layer.cornerRadius = 30.0
        
    }
    
    
    //MARK:- Alert Message
    private func displayAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title: userMessage, message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert,animated: true)
    }
    
    
    
    
    //MARK: - Prepare For HomeViewController Segue And Passing Auth_Token
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "logInToHome"
        {
            let vc = segue.destination as? HomeViewController
            vc?.auth = sender as? Auth
        }
    }
    
}







