//
//  ProfileViewModel.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 22.12.22.
//

import SwiftUI

class ProfileViewModel: ObservableObject{
    @Published var user: User
    @Published var tweets = [Tweet]()
    init(user: User){
        self.user = user
        fetchTweets()
    }
    
    func fetchTweets(){
        RequestServices.requestDomain = TWEET_BYID+"\(self.user.id)"
        RequestServices.fetchTweets { result in
            switch result{
            case .success(let data):
                guard let tweets = try? JSONDecoder().decode([Tweet].self, from: data as! Data) else { return }
                DispatchQueue.main.async {
                    self.tweets = tweets
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
        
    }
}
