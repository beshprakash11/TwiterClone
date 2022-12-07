//
//  Feed.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 25.11.22.
//

import SwiftUI

struct Feed: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .leading,spacing: 10) {//MSG_VS
                TweetCellView(tweet: "Hey Tim, are those regular glasses?", tweetImage: "post")
                    
                Divider()
                ForEach(1...20, id: \.self){_ in
                    TweetCellView(tweet: sampleText)
                    Divider()                    
                }
            }//:MSG_VS
            .padding(.top)
            .padding(.horizontal)
            .zIndex(0)
        }//FEED_SCV
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed()
    }
}
