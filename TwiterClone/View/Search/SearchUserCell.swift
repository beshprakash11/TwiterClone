//
//  SearchUserCell.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 05.12.22.
//

import SwiftUI

struct SearchUserCell: View {
    var body: some View {
        HStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
            VStack(alignment: .leading){
                Text("Besh")
                    .fontWeight(.heavy)
                Text("@yogibesh")
            }
            Spacer(minLength: 0)
        }//:HS
    }
}

struct SearchUserCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchUserCell()
    }
}
