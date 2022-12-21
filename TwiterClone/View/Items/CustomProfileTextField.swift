//
//  CustomProfileTextField.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 21.12.22.
//

import SwiftUI

struct CustomProfileTextField: View {
    @Binding var message: String
    var placeholder: String
    var body: some View {
        HStack{
            ZStack{
                HStack{
                    if message.isEmpty{
                        Text(placeholder)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                TextField("", text: $message)
                    .foregroundColor(.blue)
            }
        }//Main HS
    }
}
