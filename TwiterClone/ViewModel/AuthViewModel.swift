//
//  AuthViewModel.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 12.12.22.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    //MARK: User login
    func login(){
        
    }
    
    //MARK: Register users
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
    
    //MARK: Logout Users
    func logout(){
        
    }
}
