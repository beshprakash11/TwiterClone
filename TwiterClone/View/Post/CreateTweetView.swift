//
//  CreateTweetView.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 01.12.22.
//

import SwiftUI

struct CreateTweetView: View {
    @State var text = ""
    var body: some View {
        VStack{//:CreateTweet_VS
            HStack{//:CT_HS
                Button(action: {
                    
                }, label: {
                    Text("Cancel")
                })
                
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Tweet")
                        .padding()
                })
                .background(Color("bg"))
                .foregroundColor(.white)
                .clipShape(Capsule())
                
            }//:CT_HS
            MultilineTextField(text: $text)
        }//:CreateTweet_VS
        .padding()
    }
}

struct CreateTweetView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTweetView()
    }
}
