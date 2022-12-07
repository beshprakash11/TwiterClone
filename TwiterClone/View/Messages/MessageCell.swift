//
//  MessageCell.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 06.12.22.
//

import SwiftUI

struct MessageCell: View {
    @State var width = UIScreen.main.bounds.width
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            /*Rectangle()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(.gray)
                .opacity(0.3)*/
            HStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                    .padding(.leading)
                VStack(alignment: .leading, spacing: 0, content: {
                    HStack{
                        Text("Besh")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Text("@yogibesh")
                            .foregroundColor(.gray)
                        Spacer(minLength: 0)
                        Text("6/20/222")
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    }//:IN_HS
                    Text("You: hey! How is it going?")
                        .foregroundColor(.gray)
                    Spacer()
                })
            }//:HS
            .padding(.top, 2)
        })//:VS
        .frame(width: width, height: 84)
    }
}

struct MessageCell_Previews: PreviewProvider {
    static var previews: some View {
        MessageCell()
    }
}
