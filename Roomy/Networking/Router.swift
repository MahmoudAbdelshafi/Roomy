//
//  Router.swift
//  Roomy
//
//  Created by Mahmoud on 4/20/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import Foundation
class Router{
    
    
    enum Endpoint:String{
        
        case signIn
        case signUp
        case getRooms
        
        
        var url:URL {
            switch self {
            case .signIn:
                return URL(string:"https://roomy-application.herokuapp.com/auth/login")!
                
            case .getRooms:
                return URL(string:"https://roomy-application.herokuapp.com/rooms")!
                
            case .signUp:
                return URL(string: "https://roomy-application.herokuapp.com/signup")!
            }
        }
        
        private enum HTTPMethod {
            case get
            case post
            
            var value: String {
                switch self {
                case .get: return "GET"
                case .post: return "POST"
                    
                }
            }
        }
        
        private var method: HTTPMethod {
            switch self {
            case .getRooms: return .get
            case .signIn: return .post
            case .signUp: return .post
                
            }
        }
        
        
        //MARK:- URLRequest Method
        func asURLRequest(httpBodyForSignIn:LogInModel?,httpBodyForSignUp:SignUpModel?, _ auth:String?) throws -> URLRequest{
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = method.value
            switch self {
            case .signIn,.signUp: urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            case .getRooms: urlRequest.setValue("\(auth!)", forHTTPHeaderField: "Authorization")
            }
            switch self {
            case .signIn: urlRequest.httpBody = try! JSONEncoder().encode(httpBodyForSignIn)
            return urlRequest
            case .signUp: urlRequest.httpBody = try! JSONEncoder().encode(httpBodyForSignUp)
                return urlRequest
            case .getRooms:
                return urlRequest
            }
            
         
        }
    }
    
}
