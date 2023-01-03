//
//  Feed.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 25.11.22.
//

import SwiftUI

struct Feed: View {
    @ObservedObject var viewModel = FeedViewModel()
    let user: User
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            LazyVStack(alignment: .leading,spacing: 10) {//MSG_VS
                ForEach(viewModel.tweets){ tweet in
                    TweetCellView(viewModel: TweetCellViewModel(tweet: tweet, currentUser: user))
                }
            }//:MSG_VS
            .padding(.top)
            .padding(.horizontal)
            .zIndex(0)
        }//FEED_SCV
    }
}

