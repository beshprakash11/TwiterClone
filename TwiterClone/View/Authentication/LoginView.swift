//
//  LoginView.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 09.12.22.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var emailDone:Bool = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        if !emailDone && email.isEmpty{
            VStack{
                VStack{
                    //MARKER: Header field
                    ZStack{
                        HStack{
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Cancel")
                                    .foregroundColor(.blue)
                            })
                            Spacer()
                        }
                        .padding(.horizontal)
                        Image("Twitter")
                            .resizable()
                            .scaledToFill()
                            .padding(.trailing)
                            .frame(width: 20, height: 20)
                        
                    }//:ZS
                    Text("To get started first enter your phone, email, or @username")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    //MARK: Login
                    CustomAuthTextField(placeholder: "Phone, email or username", text: $email)
                }//:INVS
                Spacer(minLength: 0)
                //MARK: Action button field
                VStack{
                    Button(action: {
                        if !email.isEmpty{
                            self.emailDone.toggle()
                        }
                    }, label: {
                        Capsule()
                            .frame(width: 360, height: 40)
                            .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                            .overlay {
                                Text("Login")
                                    .foregroundColor(.white)
                            }
                    })
                    .padding(.bottom, 4)
                    
                    Text("Forgot Password?")
                        .foregroundColor(.blue)
                }//:Action button field
            }//:OVS
        }else{
            VStack{
                VStack{
                    //MARKER: Header field
                    ZStack{
                        HStack{
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Cancel")
                                    .foregroundColor(.blue)
                            })
                            Spacer()
                        }
                        .padding(.horizontal)
                        Image("Twitter")
                            .resizable()
                            .scaledToFill()
                            .padding(.trailing)
                            .frame(width: 20, height: 20)
                        
                    }//:ZS
                    Text("Enter your password")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    //MARK: Login
                    SecureAuthTextField(placeholder: "Password", text: $password)
                }//:INVS
                Spacer(minLength: 0)
                //MARK: Action button field
                VStack{
                    Button(action: {
                        self.emailDone.toggle()
                    }, label: {
                        Capsule()
                            .frame(width: 360, height: 40)
                            .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                            .overlay {
                                Text("Nex")
                                    .foregroundColor(.white)
                            }
                    })
                    .padding(.bottom, 4)
                    
                    Text("Forgot Password?")
                        .foregroundColor(.blue)
                }//:Action button field
            }//:OVS
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
