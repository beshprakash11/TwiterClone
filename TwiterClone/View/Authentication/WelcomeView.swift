//
//  WelcomeView.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 09.12.22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView{
            VStack{
                //MARK: TWITTER Header
                HStack{
                    Spacer(minLength: 0)
                    Image("Twitter")
                        .resizable()
                        .scaledToFill()
                        .padding(.trailing)
                        .frame(width: 20, height: 20)
                    Spacer(minLength: 0)
                }//:TWITTER Header
                Spacer(minLength: 0)
                Text("See what's happening in the world rigth now.")
                    .font(.system(size: 30, weight: .heavy, design: .default))
                    .frame(width: (getRect().width * 0.9), alignment: .center)
                Spacer(minLength: 0)
                
                //MARK: Button view
                VStack(alignment: .center, spacing: 10, content: {
                    Button(action: {
                        
                    }, label: {
                        HStack(spacing: -4, content: {
                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            Text("Continue with Google")
                                .fontWeight(.bold)
                                .font(.title3)
                                .foregroundColor(.black)
                                .padding()
                        })
                        .overlay {
                            RoundedRectangle(cornerRadius: 36)
                                .stroke(Color.blue, lineWidth: 1)
                                .opacity(0.3)
                                .frame(width: 320, height: 60, alignment: .center)
                        }
                    })
                    Button(action: {
                        
                    }, label: {
                        HStack(spacing: -4, content: {
                            Image("apple")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            Text("Continue with Apple")
                                .fontWeight(.bold)
                                .font(.title3)
                                .foregroundColor(.black)
                                .padding()
                        })
                        .overlay {
                            RoundedRectangle(cornerRadius: 36)
                                .stroke(Color.blue, lineWidth: 1)
                                .opacity(0.3)
                                .frame(width: 320, height: 60, alignment: .center)
                        }
                    })
                    
                    HStack{
                        Rectangle()
                            .foregroundColor(.gray)
                            .opacity(0.3)
                            .frame(width: (getRect().width * 0.35), height: 1)
                        Text("Or")
                            .foregroundColor(.gray)
                        Rectangle()
                            .foregroundColor(.gray)
                            .opacity(0.3)
                            .frame(width: (getRect().width * 0.35), height: 1)
                    }
                    
                    NavigationLink(destination: RegisterView().navigationBarHidden(true), label: {
                        RoundedRectangle(cornerRadius: 36)
                            .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                            .frame(width: 320, height: 60, alignment: .center)
                            .overlay {
                                Text("Create account")
                                    .fontWeight(.bold)
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                    })
                })//:Button View
                .padding()
                
                //MARK: More info
                VStack(alignment: .leading, content: {
                    VStack{
                        Text("By signing up, you agree to our")
                        +
                        Text(" Terms")
                            .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                        + Text(",")
                        Text(" Privacy Policy")
                            .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255)) + Text(", ") +
                        Text("Cookie Use")
                            .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                    }
                    .padding(.bottom)
                    
                    HStack(spacing: 2) {
                        Text("Have an account already?")
                        NavigationLink(destination:LoginView().navigationBarHidden(true)                                 ,label: {
                            Text("Login")
                                .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                        })
                        
                    }
                })//: More info
            }//:VS
            .navigationBarHidden(true)
            .navigationBarTitle("")
            .background(Color(red: 200 / 255, green: 200 / 255, blue: 200 / 255))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
