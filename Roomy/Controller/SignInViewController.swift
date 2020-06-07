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
        helper()
    }
    
    
    
    
    // MARK:- IBActions
    @IBAction func signUpPressed(_ sender: Any) {
        performSegue(withIdentifier: "signUp", sender: nil)
    }
    
    @IBAction func signInPressed(_ sender: Any) {
        let username = userNameTextField.text
        let password = passwordTextField.text
        
        // checking for empty fields
        switch (username != nil) || (password != nil) {
        //Show Alert
        case username!.isEmpty && password!.isEmpty: displayAlertMessage("Enter Username and Password")
        case username?.isEmpty: displayAlertMessage("Enter Username")
        case password?.isEmpty: displayAlertMessage("Enter Password")
            
        //LogIn
        default:SVProgressHUD.show(); Authentication.signIn(email: username!, password: password!, completionHandler: self.handelLogIn(sender:error:))
            
        }
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

//MARK:- Private Functions
extension SignInViewController{
    
    //MARK:- Helpers
    private func helper(){
        buttonShape()
        userNameTextField.underlined()
        passwordTextField.underlined()
        self.hideKeyboardWhenTappedAround()
    }
    
    //MARK: - SignIn Button Customization
    private func buttonShape(){
        signInButton.layer.borderColor = signInButton.backgroundColor?.cgColor
        signInButton.layer.borderWidth  = 1.0
        signInButton.layer.cornerRadius = 30.0
    }
    
    //MARK: - handel logIn
    private func handelLogIn(sender:Auth?,error:Error?){
        if sender != nil{
            SVProgressHUD.dismiss()
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "logInToHome", sender: sender)
            }
        }else{
            SVProgressHUD.dismiss()
            DispatchQueue.main.async {
                self.displayAlertMessage("Wrong Email or Password!")
            }
        }
    }
    
    //MARK:- Alert Message
    private func displayAlertMessage(_ userMessage:String){
        let myAlert = UIAlertController(title: userMessage, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        present(myAlert, animated: true, completion: nil)
    }
    
    
    
}



