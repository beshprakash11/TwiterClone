//
//  Home.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 25.11.22.
//

import SwiftUI

struct Home: View {
    @Binding var x : CGFloat
    @State var selectedIndex = 0
    @State var showCreateTweet = false
    @State var text:String = ""
    
    let user: User
    var body: some View {
        VStack{
            ZStack{
                TabView{
                    Feed(user: user)
                        .onTapGesture {
                            self.selectedIndex = 0
                        }
                        .navigationBarHidden(true)
                        .tabItem {
                            if (selectedIndex == 0){
                                Image("Home")
                                    .renderingMode(.template)
                                    .foregroundColor(Color("bg"))
                            }
                            else{
                                Image("Home")
                            }
                        }
                        .tag(0)
                    SearchView()
                        .onTapGesture {
                            self.selectedIndex = 1
                        }
                        .navigationBarHidden(true)
                        .tabItem{
                            if (selectedIndex != 1){
                                Image("Search")
                                    .renderingMode(.template)
                                    .foregroundColor(Color("bg"))
                            }
                            else{
                                Image("Search")
                            }
                        }
                        .tag(1)
                    NotificationsView(user: user)
                        .onTapGesture {
                            self.selectedIndex = 2
                        }
                        .navigationBarHidden(true)
                        .tabItem{
                            if (selectedIndex != 2){
                                Image("Notifications")
                                    .renderingMode(.template)
                                    .foregroundColor(Color("bg"))
                            }
                            else{
                                Image("Notifications")
                            }
                        }
                        .tag(2)
                    MessagesView()
                        .onTapGesture {
                            self.selectedIndex = 3
                        }
                        .navigationBarHidden(true)
                        .tabItem{
                            if (selectedIndex != 3){
                                Image("Messages")
                                    .renderingMode(.template)
                                    .foregroundColor(Color("bg"))
                            }
                            else{
                                Image("Messages")
                            }
                        }
                        .tag(3)
                }//:TabView
                
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action: {
                            self.showCreateTweet.toggle()
                        }, label: {
                            Image("Tweet")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding()
                                .background(Color("bg"))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        })
                    }//IN_1_HS
                    .padding()
                }//IN_1_VS
                .padding(.bottom, 65)
            }//:ZStack
            .sheet(isPresented: $showCreateTweet, content: {
                CreateTweetView(showCreateTweet: $showCreateTweet, text: text)
            })
        }//:VStack
    }
}

/*
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
*/
