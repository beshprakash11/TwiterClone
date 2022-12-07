//
//  TweetCellView.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 01.12.22.
//

import SwiftUI

struct TweetCellView: View {
    var tweet: String
    var tweetImage: String?
    var body: some View {
        VStack{//:VS
            //MARK: Twit View
            HStack(alignment: .top, spacing: 10,content: {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                VStack(alignment: .leading,spacing: 10) {
                    Text("Besh P.Yogi")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Text("@BP.Yogi")
                        .foregroundColor(.gray)
                    Text(tweet)
                        .frame(maxHeight: 100, alignment: .top)
                    
                    if let image = tweetImage{
                          GeometryReader{proxy in
                                Image(image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: proxy.frame(in: .global).width, height: 350)
                                    .cornerRadius(15)
                        }//:Geometry Reader
                        .frame(height: 350)
                    }
                }
            })//:HS
            //Cell Bottom
            HStack(spacing: 50, content: {
                //Comment
                Button(action: {
                    
                }, label: {
                    Image("Comments").resizable().frame(width: 16, height: 16)
                }).foregroundColor(.gray)
                
                //Retweet
                Button(action: {}, label: {
                    Image("Retweet").resizable().frame(width: 18, height: 14)
                }).foregroundColor(.gray)
                
                //Retweet
                Button(action: {}, label: {
                    Image("love").resizable().frame(width: 18, height: 15)
                }).foregroundColor(.gray)
                
                //Retweet
                Button(action: {}, label: {
                    Image("upload").resizable().renderingMode(.template).frame(width: 18, height: 15)
                }).foregroundColor(.gray)
                
            })//: Cell Bottom
            .padding(.top, 4)
        }//:VS
    }
}

struct TweetCellView_Previews: PreviewProvider {
    static var previews: some View {
        TweetCellView(tweet: sampleText)
    }
}

var sampleText = "Robotics is an interdisciplinary branch of computer science and engineering.[1] Robotics involves design, construction, operation, and use of robots. The goal of robotics is to design machines that can help and assist humans. Robotics integrates fields of mechanical engineering, electrical engineering, information engineering, mechatronics, electronics, bioengineering, computer engineering, control engineering, software engineering, mathematics, etc."
