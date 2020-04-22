//
//  SignUp.swift
//  Roomy
//
//  Created by Mahmoud on 4/16/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import Foundation



class SignUp {
    
    //MARK: - SignIn Request
    class func signUp(_ name:String,_ email:String,_ password:String, completionHandler: @escaping (Auth?,Error?) -> Void){
        let signUp = SignUpModel(name: name, email: email, password: password)
        let request = try! Router.Endpoint.signUp.asURLRequest(httpBodyForSignIn: nil, httpBodyForSignUp: signUp, nil)
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 201 {
                print("statusCode should be 201, but is \(httpStatus.statusCode)")
                return completionHandler(nil,error)
            }else{
                if let data = data {
                    let decoder = JSONDecoder()
                    let authKey = try! decoder.decode(Auth.self, from: data)
                    completionHandler(authKey,nil)
                }else{
                    completionHandler(nil,error)
                }
            }
        }.resume()
        
    }
    
    
    
    
    
    
    
    
    
    
}
