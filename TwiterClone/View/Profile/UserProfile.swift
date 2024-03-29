//
//  UserProfile.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 07.12.22.
//

import SwiftUI
import Kingfisher

struct UserProfile: View {
    let user: User
    
    @ObservedObject var viewModel: ProfileViewModel
    @State var offset: CGFloat = 0
    @State var titleOffset: CGFloat = 0
    @State var currentTab = "Tweets"
    @State var tabBarOffset: CGFloat = 0
    @Namespace var animation
    
    //check user authentication and followed
    var isCurrentUser: Bool{
        return viewModel.user.isCurrentUser ?? false
    }
    
    var isFollowed: Bool {
        return viewModel.user.isFollowed ?? false
    }
    //Edit Profile
    @State var editProfileShow: Bool = false
    
    init(user:User){
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
        print("User: \(viewModel.user.isCurrentUser)")
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 15) {
                GeometryReader{proxy -> AnyView in
                    let minY = proxy.frame(in: .global).minY
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    
                    return AnyView(
                        ZStack{
                            Image("banner")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: getRect().width, height: minY > 0 ? 180 + minY : 180, alignment: .center)
                                .cornerRadius(0)
                            BlurView()
                                .opacity(blurViewOpacity())
                            
                            //MARK: Title view
                            VStack(spacing: 5, content: {
                                Text(self.user.username)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("150 tweets")
                                    .foregroundColor(.white)
                            })
                            .offset(y: 120)
                            .offset(y: titleOffset > 100 ? 0 : -getTitleOffset())
                            .opacity(titleOffset < 100 ? 1 : 0)
                        }//:ZS
                            .clipped()
                            .frame(height: minY > 0 ?  180 + minY : nil)
                            .offset(y: minY > 0 ? -minY :  -minY < 80 ? 0 :  -minY - 80)
                    )
                }//:GeometryReader
                .frame(height: 180)
                .zIndex(1)
                
                //MARK: Profile Picture
                VStack(alignment: .leading){
                    //Profile pic
                    HStack{
                        KFImage(URL(string:USER_BYID + "\(self.viewModel.user.id)/avatar"))
                            .placeholder({
                                Image("logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 75, height: 75)
                                    .clipShape(Circle())
                            })
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .padding(8)
                            .background(Color.white.clipShape(Circle()))
                            .offset(y: offset < 0 ? getOffset() - 20 : -20)
                            .scaleEffect(getScale())
                        Spacer()
                        if(self.isCurrentUser){
                            Button(action: {
                                self.editProfileShow.toggle()
                            }, label: {
                                Text("Edit Profile")
                                    .foregroundColor(.blue)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal)
                                    .background(Capsule().stroke(.blue, lineWidth: 1.5))
                            })
                            .sheet(isPresented: $editProfileShow, content: {
                                EditProfileView(user: $viewModel.user)
                            })
                        }else{
                            Button(action: {
                                //Add the func to follow and unfolow
                                isFollowed ? self.viewModel.unfollow() : self.viewModel.follow()
                            }, label: {
                                Text(isFollowed ? "Following" : "Follow")
                                    .foregroundColor(isFollowed ? .black: .white)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(
                                        ZStack{
                                            Capsule()
                                                .stroke(Color.blue, lineWidth: isFollowed ? 1.5 : 0)
                                                .foregroundColor(isFollowed ? .white: .red)
                                            Capsule()
                                                .foregroundColor(isFollowed ? .white : .blue)
                                        }
                                    )
                            })
                        }
                    }//:profile pic
                    .padding(.top, -25)
                    .padding(.bottom, -10)
                    .zIndex(1)
                    
                    //MARK: Profile Description
                    HStack{
                        VStack(alignment: .leading, spacing: 8, content: {
                            Text(self.viewModel.user.username)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Text("@\(self.viewModel.user.username)")
                                .foregroundColor(.gray)
                            Text(viewModel.user.bio ?? "Don't know what I don't know. So, I try to figure out what I don't know. ")
                            //user location
                            HStack(spacing: 8) {
                                //location
                                if let userLocation = viewModel.user.location{
                                    if (userLocation != ""){
                                        HStack(spacing: 2) {
                                            Image(systemName: "mappin.circle.fill")
                                                .frame(width: 24, height: 24)
                                                .foregroundColor(.gray)
                                            Text(userLocation)
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                    }
                                }
                                
                                //website
                                if let userWebsite = viewModel.user.website{
                                    if (userWebsite != ""){
                                        HStack(spacing: 2) {
                                            Image(systemName: "link")
                                                .frame(width: 24, height: 24)
                                                .foregroundColor(.gray)
                                            Text(userWebsite)
                                                .foregroundColor(Color("bg"))
                                                .font(.system(size: 14))
                                        }
                                    }
                                }
                                
                            }//:UL HS
                            
                            //Follower and details
                            HStack(spacing: 5, content: {
                                Text("13")
                                    .foregroundColor(.primary)
                                    .fontWeight(.semibold)
                                Text("Fllowers")
                                    .foregroundColor(.gray)
                                Text("680")
                                    .foregroundColor(.primary)
                                    .fontWeight(.semibold)
                                    .padding(.leading, 10)
                                Text("Following")
                                    .foregroundColor(.gray)
                            })
                            .padding(.top, 8)
                        })//:Profile Description
                        .padding(.leading, 8)
                        .overlay (
                            GeometryReader{ proxy -> Color in
                                let minY = proxy.frame(in: .global).minY
                                
                                DispatchQueue.main.async {
                                    self.titleOffset = minY
                                }
                                
                                return Color.clear
                            }//:Geometry
                                .frame(width: 0, height: 0), alignment: .top
                        )
                        Spacer()
                    }//:HS
                    //MARK: Main View
                    VStack(spacing: 0, content: {
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack(spacing: 0, content: {
                                TabButton(title: "Tweets", currentTab: $currentTab, animation: animation)
                                TabButton(title: "Tweets & Likes", currentTab: $currentTab, animation: animation)
                                TabButton(title: "Media", currentTab: $currentTab, animation: animation)
                                TabButton(title: "Likes", currentTab: $currentTab, animation: animation)
                            })
                        })//:SV
                        Divider()
                    })
                    .padding(.top, 30)
                    .background(Color.white)
                    .offset(y: tabBarOffset < 90 ? -tabBarOffset + 90 : 0)
                    .overlay(
                        GeometryReader{proxy -> Color in
                            let minY = proxy.frame(in: .global).minY
                            DispatchQueue.main.async {
                                self.tabBarOffset = minY
                            }
                            
                            return Color.clear
                        }//:Proxy
                            .frame(width: 0, height: 0)
                        , alignment: .top
                    )
                    .zIndex(1)
                    
                    //Tweets view
                    VStack(spacing: 18, content: {
                        ForEach(viewModel.tweets){tweet in
                            TweetCellView(viewModel: TweetCellViewModel(tweet: tweet, currentUser: AuthViewModel.shared.curretnUser!))
                        }
                    })//:Tweets view
                    .padding(.top)
                    .zIndex(0)
                }
                .padding(.horizontal)
                .zIndex(-offset > 80 ? 0 : 1)
                //:ProfilePic
                
            }//:M_VS
        }//:SCV
        .ignoresSafeArea(.all, edges: .top)
        //.background(Color.white)
    }
}



extension UserProfile{
    func blurViewOpacity() -> Double {
        let progress = -(offset + 80) / 150
        return Double(-offset > 80 ? progress : 0)
    }
    
    func getTitleOffset() -> CGFloat{
        let progress = 20 / titleOffset
        let offset = 60 * (progress > 0 && progress <= 1 ? progress : 1)
        return offset
    }
    
    func getOffset() -> CGFloat{
        let progress = (-offset / 80) * 20
        return progress <= 20 ? progress : 20
    }
    
    func getScale() -> CGFloat {
        let progress = -offset / 80
        let scale = 1.8 - (progress < 1.0 ? progress : 1)
        
        return scale < 1 ? scale : 1
    }
}
