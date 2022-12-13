//
//  CreateTweetViewModel.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 13.12.22.
//

import Foundation
import SwiftUI

class CreateTweetViewModel: ObservableObject{
    func uploadPost(text: String){
        guard let user = AuthViewModel.shared.curretnUser else { return }
        
        RequestServices.requestDomain = POST_TWEET
        
        RequestServices.postTweet(text: text, user: user.name, username: user.username, userId: user.id) { result in
            debugPrint("Tweets Results: ",result)
        }
        
    }
}
