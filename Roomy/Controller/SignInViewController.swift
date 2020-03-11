//
//  SignInViewController.swift
//  Roomy
//
//  Created by Mahmoud on 3/9/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    
    //Outlets
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonShape()
        userNameTextField.underlined()
        passwordTextField.underlined()
        
    
    }
    
    
    
    func buttonShape(){
        
        //ButtonShape
        signInButton.layer.borderColor = signInButton.backgroundColor?.cgColor
              signInButton.layer.borderWidth  = 1.0
               signInButton.layer.cornerRadius = 30.0
        
       
        
    }

}





























extension UITextField{
    
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height + 0.0 - width, width:  self.frame.size.width + 30.0 , height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    
}
