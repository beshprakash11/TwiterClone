//
//  RegisterView.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 09.12.22.
//

import SwiftUI

struct RegisterView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        //MARK: Register
        VStack{
            ZStack{
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.blue)
                    })
                    Spacer()
                }//:
                .padding(.horizontal)
                Image("Twitter")
                    .resizable()
                    .scaledToFill()
                    .padding(.trailing)
                    .frame(width: 20, height: 20)
            }//:ZStack
            Text("Create your account")
                .font(.title)
                .bold()
                .padding(.top, 35)
            
            //MARK: Textfield view
            VStack{
                CustomAuthTextField(placeholder: "Name", text: $name)
                CustomAuthTextField(placeholder: "Phone Number or Email", text: $email)
                SecureAuthTextField(placeholder: "Passowrd", text: $password)
            }
            Spacer(minLength: 0)
            // Textfield view
            
            //MARK: Action button parts
            VStack{
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                HStack{
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Capsule()
                            .frame(width: 60, height: 30, alignment: .center)
                            .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                            .overlay {
                                Text("Next")
                                    .foregroundColor(.white)
                            }
                    })
                }
                .padding(.trailing, 24)
            }//
        }//: Register
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
