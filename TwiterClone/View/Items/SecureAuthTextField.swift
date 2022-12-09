//
//  SecureAuthTextField.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 09.12.22.
//

import SwiftUI

struct SecureAuthTextField: View {
    var placeholder: String
    @Binding var text: String
    var body: some View {
        VStack{
            ZStack(alignment: .leading, content: {
                if text.isEmpty{
                    Text(placeholder)
                        .foregroundColor(.gray)
                }
                SecureField("", text: $text)
                    .frame(height: 45)
                    .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
            })//:ZStack
            Rectangle()
                .frame(height: 1, alignment: .center)
                .foregroundColor(.gray)
                .padding(.top, -2)
        }//:
        .padding(.horizontal)
    }
}
/*
struct SecureAuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        SecureAuthTextField()
    }
}
*/
