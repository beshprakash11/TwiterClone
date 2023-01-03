//
//  TweetCellViewModel.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 16.12.22.
//

import SwiftUI

class TweetCellViewModel: ObservableObject{
    @Published var tweet: Tweet
    @Published var user: User?
    
    init(tweet: Tweet){
        self.tweet = tweet
        fetchUser(userId: tweet.user)
    }
    
    func fetchUser(userId: String){
        AuthServices.requestDomain = USER_BYID + "\(userId)"
        
        AuthServices.fetchUser(id: userId) { result in
            switch result{
            case .success(let data):
                guard let user = try? JSONDecoder().decode(User.self, from: data as! Data) else { return }
                DispatchQueue.main.async {
                    self.user = user
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func like(){
        
    }
    
    func unlike(){
        
    }
}
