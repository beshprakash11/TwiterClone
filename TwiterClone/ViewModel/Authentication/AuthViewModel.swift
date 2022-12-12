//
//  AuthViewModel.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 12.12.22.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var curretnUser: User?
    
    init(){
        let defaults = UserDefaults.standard
        let token = defaults.object(forKey: "jsonwebtoken")
        
        if token != nil{
            isAuthenticated = true
            
            if let userId = defaults.object(forKey: "userid"){
                fetchUser(userId: userId as! String)
            }
        }else{
            isAuthenticated = false
        }
    }
    
    static let shared = AuthViewModel()
    
    //MARK: User login model
    func login(email: String, password: String){
        let defaults = UserDefaults.standard
        
        AuthServices.login(email: email, password: password) { [self] result in
            switch result{
            case .success(let data):
                debugPrint("AuthVM success")
                guard let user = try? JSONDecoder().decode(ApiResponse.self, from: data as! Data) else { return }
                DispatchQueue.main.async {
                    defaults.set(user.token, forKey: "jsonwebtoken")
                    defaults.set(user.user.id, forKey: "userid")
                    self.isAuthenticated = true
                    self.curretnUser = user.user
                }
                
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    //MARK: Register model
    func register(username: String, name: String, email: String, password: String){
        AuthServices.register(email: email, username: username, password: password, name: name) { result in
            switch result{
            case .success(let data):
                debugPrint("AuthVM success")
                guard let user = try? JSONDecoder().decode(ApiResponse.self, from: data as! Data) else { return }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    //MARK: Fetch user Model
    func fetchUser(userId: String){
        AuthServices.fetchUser(id: userId) { result in
            switch result{
            case .success(let data):
                guard let user = try? JSONDecoder().decode(User.self, from: data as! Data) else { return}
                DispatchQueue.main.async {
                    UserDefaults.standard.setValue(user.id, forKey: "userid")
                    self.isAuthenticated = true
                    self.curretnUser = user
                    debugPrint(user)
                }
            case .failure(let err):
                debugPrint(err.localizedDescription)
            }
        }
    }
    //MARK: Logout Users
    func logout(){
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        
        dictionary.keys.forEach{key in
            defaults.removeObject(forKey: key)
        }
        
        DispatchQueue.main.async {
            self.isAuthenticated = false
        }
    }
}
