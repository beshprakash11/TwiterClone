//
//  SearchViewModel.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 10.01.23.
//

import SwiftUI

class SSearchViewModel: ObservableObject{
    @Published var user = [User]()
    
    init(){
        fetchUsers()
    }
    func fetchUsers(){
        AuthServices.requestDomain  = BASE_URL + "users"
        
        AuthServices.fetchUser { result in
            switch result{
            case .success(let data):
                guard let users = try? JSONDecoder().decode([User].self, from: data as! Data) else { return }
                DispatchQueue.main.async {
                    self.user = users
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
