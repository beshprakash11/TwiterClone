//
//  FeedViewModel.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 16.12.22.
//

import Foundation
class FeedViewModel: ObservableObject{
    @Published var tweets = [Tweet]()
    
    init(){
        fetchTweets()
    }
    func fetchTweets(){
        RequestServices.requestDomain = POST_TWEET //post and get has same URL
        
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
