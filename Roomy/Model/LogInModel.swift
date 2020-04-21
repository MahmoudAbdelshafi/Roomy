//
//  LogInModel.swift
//  Roomy
//
//  Created by Mahmoud on 4/6/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import Foundation

struct LogInModel: Codable{

let email:String
let password:String
}

struct Auth:Codable {
    let token:String

    
    enum CodingKeys: String,CodingKey{
        case token = "auth_token"
  
    }
    
}
