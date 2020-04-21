//
//  RoomsModel.swift
//  Roomy
//
//  Created by Mahmoud on 4/7/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import Foundation
import RealmSwift

class RoomsModel: Object, Codable {
    @objc dynamic var id:Int = 0
    @objc dynamic var title:String? = ""
    @objc dynamic var price:String? = ""
    @objc dynamic var place:String? = ""
    @objc dynamic var image:String? = ""
    @objc dynamic var roomDescription:String? = ""
    
    
    enum CodingKeys: String, CodingKey {
        case id, title, price, place, image
        case roomDescription = "description"
         
    }
}





