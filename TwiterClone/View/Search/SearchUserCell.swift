//
//  SearchUserCell.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 05.12.22.
//

import SwiftUI
import Kingfisher

struct SearchUserCell: View {
    let user: User
    
    var body: some View {
        HStack{
            KFImage(URL(string: BASE_URL + "/users/\(self.user.id)/avatar"))
                .placeholder({
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                        .clipShape(Circle())
                })
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
            VStack(alignment: .leading){
                Text(user.name)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Text(user.username)
                    .foregroundColor(.white)
            }
            Spacer(minLength: 0)
        }//:HS
    }
}
