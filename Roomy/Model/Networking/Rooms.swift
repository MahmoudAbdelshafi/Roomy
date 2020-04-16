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
    
    
    //MARK:- Request Rooms Data
    class func requestAllRooms(_ auth_token:String,completionHandler: @escaping ([RoomsModel]?,Error?) -> Void){
        let url = URL(string: "https://roomy-application.herokuapp.com/rooms")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("\(auth_token)", forHTTPHeaderField: "Authorization")
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
    
    
    
    //MARK:- Request ImageFile
    class func requestImageFile(urlString: String, comlitionHandler: @escaping (UIImage?,Error?) -> Void) {
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else {comlitionHandler(nil,error)
                return}
            
            let downLoadedImage = UIImage(data: data)
            comlitionHandler(downLoadedImage,nil)
        }
        task.resume()
        
    }
    
    
      
    
    
    
    
    
}
