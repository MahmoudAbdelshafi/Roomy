//
//  LogIn.swift
//  Roomy
//
//  Created by Mahmoud on 4/1/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import Foundation

class LogIn {
   
    enum Endpoint:String {
        case signIn = "https://roomy-application.herokuapp.com/auth/login"
        var url:URL {
            return URL(string: self.rawValue)!
        }
    }
    
 
    
    //MARK: - SignIn Request
    class func signIn(email:String,password:String , completionHandler: @escaping (Auth?,Error?) -> Void){
           
        let logIn = LogInModel(email: email, password: password)
        var request = URLRequest(url: Endpoint.signIn.url)
           request.httpMethod = "POST"
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           request.httpBody = try! JSONEncoder().encode(logIn)
           let session = URLSession.shared
           session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                let authKey = try! decoder.decode(Auth.self, from: data)
                completionHandler(authKey,nil)
            }else{
                completionHandler(nil,error)
            }
    
           }.resume()
           
       }
    
 
    
    
    
    
    
    
    
    
}
