//
//  HomeTableViewCell.swift
//  Roomy
//
//  Created by Mahmoud on 3/9/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    //MARK:- IBOutlets
   
    @IBOutlet weak var firstImg: UIImageView!
    @IBOutlet weak var secondImg: UIImageView!
    @IBOutlet weak var thirdImg: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}


