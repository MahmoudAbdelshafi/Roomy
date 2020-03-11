//
//  ListingViewController.swift
//  Roomy
//
//  Created by Mahmoud on 3/9/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import UIKit

class ListingViewController: UIViewController {

    @IBOutlet weak var infoButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
buttonShape()
    }
    func buttonShape(){
        
        //ButtonShape
        infoButton.layer.borderColor = infoButton.backgroundColor?.cgColor
              infoButton.layer.borderWidth  = 1.0
               infoButton.layer.cornerRadius = 25.0
        
       
        
    }

}
