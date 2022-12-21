//
//  SlideMenu.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 06.12.22.
//

import SwiftUI
var menuButton = ["Profile", "Lists", "Topics", "Bookmarks", "Moments"]

struct SlideMenu: View {
    @ObservedObject var viewModel: AuthViewModel
    @State var show:Bool = true
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var width = UIScreen.main.bounds.width
    var body: some View {
        VStack{
            //MARK: Headerfiles
            HStack(spacing: 0, content: {
                //Top Slide
                VStack(alignment: .leading, content: {
                    NavigationLink(destination: UserProfile(user: viewModel.curretnUser!).navigationBarHidden(true), label: {
                        Image("logo")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    })
                    
                    //MARK: Follower&Username
                    HStack(alignment: .top, spacing: 12, content: {
                        //:UserName
                        VStack(alignment: .leading, spacing: 12, content: {
                            NavigationLink(destination: UserProfile(user: viewModel.curretnUser!), label: {
                                Text(viewModel.curretnUser!.username)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            })
                            
                            Text("@\(viewModel.curretnUser!.username)")
                                .foregroundColor(.gray)
                            //:Follower
                            HStack(spacing: 20, content: {
                                FollowView(count: 8, title: "Following")
                                FollowView(count: 16, title: "Follower")
                            })
                            .padding(.top, 10)
                            //:Follower
                            Divider()
                                .padding(.top, 10)
                        })//: UserName
                        Spacer(minLength: 0)
                        Button(action: {
                            withAnimation {
                                self.show.toggle()
                            }
                        }, label: {
                            Image(systemName: show ? "chevron.down" : "chevron.up")
                                .foregroundColor(Color("bg"))
                        })

                    })//:Follower&UserName
                    
                    //MARK: DROPDOWN Content
                    VStack(alignment: .leading, content: {
                        ForEach(menuButton, id: \.self){item in
                            MenuButton(title: item)
                        }
                        
                        Divider()
                            .padding(.top)
                        Button(action: {
                            
                        }, label: {
                            MenuButton(title: "Twitter Ads")
                        })
                        
                        Divider()
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Settings and Privacy")
                                .foregroundColor(.black)
                        })
                        .padding(.top, 20)
                        Button(action: {
                            
                        }, label: {
                            Text("Help Centre")
                                .foregroundColor(.black)
                        })
                        .padding(.top, 20)
                        Spacer(minLength: 0)
                        Divider()
                            .padding(.bottom)
                        
                        //MARK: Action Btn
                        HStack{
                            Button(action: {
                                
                            }, label: {
                                Image("help")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .foregroundColor(Color("bg"))
                            })
                            Spacer(minLength: 0)
                            Image("barcode")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 26, height: 26)
                                .foregroundColor(Color("bg"))
                        }//:Action Btn
                    })//:dropdwon content
                    .opacity(show ? 1 : 0)
                    .frame(height: show ? nil : 0)
                    
                    //MARK: Bottom view
                    VStack(alignment: .leading, content: {
                        Button(action: {
                            
                        }, label: {
                            Text("Crate a new account")
                                .foregroundColor(Color("bg"))
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Add an existing account")
                                .foregroundColor(Color("bg"))
                        })
                        Spacer(minLength: 0)
                    })
                    .opacity(!show ? 1 : 0)
                    .frame(height: !show ? nil : 0)
                    //bottom view
                })//:TopSlide
                .padding(.horizontal, 20)
                .padding(.top, edges?.top == 0 ? 15 : edges?.top)
                .padding(.bottom, edges?.bottom == 0 ? 15 : edges?.bottom)
                .frame(width: width - 90)
                .background(.white)
                .ignoresSafeArea(.all, edges: .vertical)
                Spacer(minLength: 0)
                
            })//:HeaderFile
        }//:VS
    }
}

struct SlideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SlideMenu(viewModel: AuthViewModel.shared)
    }
}
