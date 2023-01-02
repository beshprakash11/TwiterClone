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
        checkIfUserIsCurrentUser()
        checkIfUserIsfollowed()
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
    
    //MARK: Check login user is current users
    func checkIfUserIsCurrentUser(){
        if(self.user._id == AuthViewModel.shared.curretnUser?.id){
            self.user.isCurrentUser = true
        }
    }
    
    func follow(){
        RequestServices.requestDomain = USER_BYID + "\(self.user.id)/follow"
        RequestServices.followingProcess(id: self.user.id) { result in
            debugPrint("Follow: ", result)
        }
        self.user.isFollowed = false
    }
    
    func unfollow(){
        RequestServices.requestDomain = USER_BYID + "\(self.user.id)/unfollow"
        RequestServices.followingProcess(id: self.user.id) { result in
            debugPrint("Follow: ", result)
        }
    }
    
    func checkIfUserIsfollowed(){
        if(self.user.followers.contains(AuthViewModel.shared.curretnUser!._id)){
            self.user.isFollowed = true
        }else{
            self.user.isFollowed = false
        }
    }
}
