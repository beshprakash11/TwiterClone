//
//  TweetCellView.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 01.12.22.
//

import SwiftUI
import Kingfisher

struct TweetCellView: View {
    @ObservedObject var viewModel: TweetCellViewModel
    
    init(viewModel: TweetCellViewModel){
        self.viewModel = viewModel
    }
    var body: some View {
        VStack{//:VS
            //MARK: Twit View
           
            HStack(alignment: .top, spacing: 10,content: {
                if let user = viewModel.user{
                    NavigationLink(destination: UserProfile(user: user)) {
                        KFImage(URL(string:USER_BYID + "\(self.viewModel.tweet.userId)/avatar"))
                            .placeholder({
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 55, height: 55)
                                    .clipShape(Circle())
                            })
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())
                    }
                }
                
                VStack(alignment: .leading,spacing: 10) {
                    Text("\(self.viewModel.tweet.username)")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Text("@\(self.viewModel.tweet.username)")
                        .foregroundColor(.gray)
                    Text(self.viewModel.tweet.text)
                        .frame(maxHeight: 100, alignment: .top)
                    
                    if let imageId = viewModel.tweet.id {
                        if viewModel.tweet.image == "true"{
                            GeometryReader{proxy in
                                  KFImage(URL(string: TWEET_IMAGE+"\(imageId)/image"))
                                      .resizable()
                                      .aspectRatio(contentMode: .fill)
                                      .frame(width: proxy.frame(in: .global).width, height: 250)
                                      .cornerRadius(15)
                          }//:Geometry Reader
                          .frame(height: 250)
                        }
                    }
                }
                Spacer()
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


var sampleText = "Robotics is an interdisciplinary branch of computer science and engineering.[1] Robotics involves design, construction, operation, and use of robots. The goal of robotics is to design machines that can help and assist humans. Robotics integrates fields of mechanical engineering, electrical engineering, information engineering, mechatronics, electronics, bioengineering, computer engineering, control engineering, software engineering, mathematics, etc."
