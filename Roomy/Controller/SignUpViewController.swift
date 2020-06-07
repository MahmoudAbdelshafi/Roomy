//
//  SignUpViewController.swift
//  Roomy
//
//  Created by Mahmoud on 4/8/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import UIKit
import SVProgressHUD

class SignUpViewController: UIViewController {
    
    //MARK:- Prrperties
    
    
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helper()
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
            SVProgressHUD.show()
            Authentication.signUp(username!, email!, password!, completionHandler: handelSignUp(sender:error:))
        }
    }
    
    @IBAction func logInPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   
    //MARK: - Prepare For HomeViewController Segue And Passing Auth_Token
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "signUpToHome"
        {
            let vc = segue.destination as? HomeViewController
            vc?.auth = sender as? Auth
        }
    }
    
}







//MARK:- Private
extension SignUpViewController{
    //MARK: - SignUp Button Customization
    private func buttonShape(){
        signUpButton.layer.borderColor = signUpButton.backgroundColor?.cgColor
        signUpButton.layer.borderWidth  = 1.0
        signUpButton.layer.cornerRadius = 30.0
    }

    //MARK:- Helpers
    private func helper(){
        buttonShape()
        EmailTextField.underlined()
        userNameTextField.underlined()
        passwordTextField.underlined()
        hideKeyboardWhenTappedAround()
    }
    
    //MARK:- Alert Message
    private func displayAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title: userMessage, message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert,animated: true)
    }
    
    //MARK: - handel logIn
    private func handelSignUp(sender:Auth?,error:Error?){
        if sender != nil{
            SVProgressHUD.dismiss()
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "signUpToHome", sender: sender)
            }
        }else{
            SVProgressHUD.dismiss()
            DispatchQueue.main.async {
                self.displayAlertMessage(userMessage: "Please write a valid Email!")
            }
        }
    }
}
