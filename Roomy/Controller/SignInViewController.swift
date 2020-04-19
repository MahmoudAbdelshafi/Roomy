//
//  SignInViewController.swift
//  Roomy
//
//  Created by Mahmoud on 3/9/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import UIKit
import SVProgressHUD







class SignInViewController: UIViewController {
    
    //MARK:- Properties
    var auth_Key:Auth?
    
    
    
    
    //MARK:- Outlets
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // displayAlertMessage("hhhhhh")
        
        helper()
        //        LogIn.signIn(email: "mahmoud@gmail.com", password: "12345678") {auth,error in
        //            self.auth_Key = auth
        //
        //            DispatchQueue.main.async {
        //
        //
        //                self.performSegue(withIdentifier: "logInToHome", sender: auth)
        //            }
        //        }
        
    }
    
    
    
    
    // MARK:- IBActions
    @IBAction func signInPressed(_ sender: Any) {
        let username = userNameTextField.text
        let password = passwordTextField.text
        
        // check for empty fields
        
        switch (username != nil) || (password != nil) {
        //Show Alert
        case username!.isEmpty && password!.isEmpty: displayAlertMessage("Enter Username and Password")
        case username?.isEmpty: displayAlertMessage("Enter Username")
        case password?.isEmpty: displayAlertMessage("Enter Password")
            
        //LogIn
        default:SVProgressHUD.show(); LogIn.signIn(email: username!, password: password!, completionHandler: self.handelLogIn(sender:error:))
            
        }
        
        
        
        
        
    }
    
    //MARK: - handel logIn
    func handelLogIn(sender:Auth?,error:Error?){
        if error != nil{
            SVProgressHUD.dismiss()
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "logInToHome", sender: sender)
            }
        }else{
            SVProgressHUD.dismiss()
            DispatchQueue.main.async {
                self.displayAlertMessage("Wrong Email or Password")
            }
        }
    }
    
    
    //MARK: - SignIn Button Customization
    func buttonShape(){
        signInButton.layer.borderColor = signInButton.backgroundColor?.cgColor
        signInButton.layer.borderWidth  = 1.0
        signInButton.layer.cornerRadius = 30.0
    }
    
    
    //MARK:- Alert Message
    private func displayAlertMessage(_ userMessage:String){
        
        
        
        let myAlert = UIAlertController(title: userMessage, message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        
        present(myAlert, animated: true, completion: nil)
        
    }
    
    
    //MARK:- Helpers
    func helper(){
        buttonShape()
        userNameTextField.underlined()
        passwordTextField.underlined()
        self.hideKeyboardWhenTappedAround()
        
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







