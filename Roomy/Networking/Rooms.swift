//
//  Rooms.swift
//  Roomy
//
//  Created by Mahmoud on 4/6/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import Foundation
import UIKit

class Rooms {
    
    //MARK:- Rooms Data Request 
    class func requestAllRooms(_ auth_token:String,completionHandler: @escaping ([RoomsModel]?,Error?) -> Void){
        let request = try! Router.Endpoint.getRooms.asURLRequest(nil, auth_token)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
            let decoder = JSONDecoder()
            do{
                let roomsModel =  try decoder.decode([RoomsModel].self, from: data)
                completionHandler(roomsModel,nil)
            }catch {
                completionHandler(nil,error)
            }
        }
        task.resume()
        
    }
    
    
    
    
}
