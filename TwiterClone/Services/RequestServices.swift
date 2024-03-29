//
//  RequestServices.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 13.12.22.
//

import Foundation

public class RequestServices{
    public static var requestDomain = ""
    
    public static func postTweet(text: String, user:String, username:String, userId:String, completion:@escaping (_ result: [String: Any]?) ->Void) {
        let params = ["text": text, "userId": userId, "user":user, "username": username] as [String : Any]
        
        let url = URL(string: requestDomain)!
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        }catch let error as NSError{
            debugPrint(error.localizedDescription)
        }
        
        //Authentication Part in the HTTP Request
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, res, err in
            guard err == nil else { return }
            guard let data = data else { return }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)as? [String: Any]{
                    completion(json)
                }
            }catch let error {
                debugPrint(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    static func fetchData(completion: @escaping (_ result: Result<Data?, NetworkError>) -> Void){
        let url = URL(string: requestDomain)!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        
        //debugPrint(request)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, res, err in
            guard err == nil else{
                completion(.failure(.noData))
                return
            }
            
            guard let data = data else { return }
            completion(.success(data))
        }
        task.resume()
    }
    
    public static func followingProcess(id: String, completion: @escaping (_ result: [String: Any]?) -> Void){
        let url = URL(string: requestDomain)!
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("applicatoin/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, res, err in
            guard err == nil else { return }
            
            guard let data = data else { return }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]{
                    completion(json)
                }
            }catch{
                debugPrint("Following: ", err?.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    
    public static func likeTweet(id: String, completion: @escaping (_ result: [String :Any]?) -> Void){
        let url = URL(string: requestDomain)!
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
        
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTask(with: request){ data, res, err in
            guard err == nil else { return }
            guard let data = data else { return }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String : Any]{
                    completion(json)
                }
            }catch let error {
                debugPrint("Like error: ", error.localizedDescription)
            }
            
        }
        task.resume()
    }
    
    public static func sendNotification(username: String, notSenderId: String, notReceiverId: String, notificationType: String, postText: String, completion: @escaping (_ result: [String: Any]? ) -> Void){
        
        var params: [String: Any]{
            return postText.isEmpty ? ["username" : username, "notSenderId": notSenderId, "notReceiverId": notReceiverId, "notificationType": notificationType] as [String: Any] : ["username" : username, "notSenderId": notSenderId, "notReceiverId": notReceiverId, "notificationType": notificationType, "postText" : postText] as [String: Any]
        }
        
        let url = URL(string: requestDomain)!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        }catch let error {
            print(error.localizedDescription)
        }
        
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, res, err in
            guard err == nil else { return }
            
            guard let data = data else { return }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]{
                    completion(json)
                }
            }catch let error{
                debugPrint(error.localizedDescription)
            }
        }
    }
}
