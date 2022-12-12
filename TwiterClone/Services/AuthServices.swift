//
//  AuthServices.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 12.12.22.
//

import Foundation
import SwiftUI

enum NetworkError: Error{
    case invalidURL
    case noData
    case decodingError
}

enum AuthenticationError: Error{
    case invalidCredentials
    case custom(errorMessage: String)
}
public class AuthServices{
    public static var requestDomain = ""
    
    //MARK: Login services
    static func login(email: String, password: String, completion: @escaping (_ result: Result<Data?,AuthenticationError>) -> Void){
        let urlString = URL(string: LOGIN_URL)!
        
        debugPrint(urlString)
        
        makeRequest(urlString: urlString, reqBody: ["email": email, "password": password]) { result in
            switch result{
            case .success(let data):
                debugPrint("Login success")
                completion(.success(data))
            case .failure(let error):
                debugPrint(error.localizedDescription)
                completion(.failure(.invalidCredentials))
            }
        }
    }
    
    //MARK: Registration Services
    static func register(email: String, username: String, password:  String, name: String, completion: @escaping (_ result: Result<Data?, AuthenticationError>) -> Void){
        let urlStirng = URL(string: POST_URL)!
        
        makeRequest(urlString: urlStirng, reqBody: ["email": email, "username": username, "name": name, "password": password]) { result in
            switch result{
            case .success(let data):
                debugPrint("Register success")
                completion(.success(data))
            case .failure(let error):
                debugPrint("POST ", error)
                completion(.failure(.invalidCredentials))
            }
        }
    }
    
    static func makeRequest(urlString: URL, reqBody: [String: Any], completion: @escaping
                            (_ result: Result<Data?,NetworkError>) -> Void){
        let session = URLSession.shared
        var request = URLRequest(url: urlString)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: reqBody, options: .prettyPrinted)
        }catch let error as NSError{
            debugPrint("Data conversion error: ", error)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, res, err in
            guard err == nil else{ return }
            guard let data = data else {
                completion(.failure(.noData))
                return
                
            }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]{
                    debugPrint(json)
                }
            }catch let error as NSError{
                completion(.failure(.decodingError))
                debugPrint(error)
            }
            
        }
        
        task.resume()
    }
    
    //MARK: Fetch user services
    static func fetchUser(id: String, completion: @escaping (_ result: Result<Data, AuthenticationError>) -> Void){
        let urlString = URL(string: USER_BYID + "\(id)")!
        
        debugPrint(urlString)
        var urlRequest = URLRequest(url: urlString)
        
        let session = URLSession.shared
        
        urlRequest.httpMethod = "GET"
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: urlRequest) { data, res, err in
            guard let err = err else { return }
            guard let data = data else {
                return
                completion(.failure(.invalidCredentials))
            }
            completion(.success(data))
            
            do{
                if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]{
                    
                }
            }catch let err{
                completion(.failure(.invalidCredentials))
                debugPrint(err)
            }
        }
        task.resume()
    }
}