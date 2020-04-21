//
//  Extension.swift
//  Roomy
//
//  Created by Mahmoud on 4/8/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import Foundation
import UIKit


//MARK: - Dismess Keyboard


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}





//MARK:- Text Field Customizatio
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
