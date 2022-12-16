//
//  TweetCellViewModel.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 16.12.22.
//

import SwiftUI

class TweetCellViewModel: ObservableObject{
    @Published var tweet: Tweet
    
    init(tweet: Tweet){
        self.tweet = tweet
    }
}
