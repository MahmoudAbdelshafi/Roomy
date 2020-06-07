//
//  ListingViewController.swift
//  Roomy
//
//  Created by Mahmoud on 3/9/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import UIKit

class ListingViewController: UIViewController {
    //MARK:- Properties
    var room:RoomsModel?
    
    //MARK:- IBOutlets
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonShape()
        if room != nil{
        descriptionLabel.text = room?.roomDescription
        }
    }
    
    //MARK:- IBActions
    @IBAction func dismissPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

   //MARK:- Button Customize
    func buttonShape(){
        infoButton.layer.borderColor = infoButton.backgroundColor?.cgColor
        infoButton.layer.borderWidth  = 1.0
        infoButton.layer.cornerRadius = 25.0
        }
  
   
    
}
