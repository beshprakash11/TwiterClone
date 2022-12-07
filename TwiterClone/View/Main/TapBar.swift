//
//  TapBar.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 06.12.22.
//

import SwiftUI

struct TapBar: View {
    @Binding var x:CGFloat
    @State var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    withAnimation{
                        x = 0
                    }
                }, label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 24))
                        .foregroundColor(Color("bg"))
                })
                Spacer(minLength: 0)
                Image("Twitter")
                    .resizable()
                    .scaledToFit()
                    .padding(.trailing)
                    .frame(width: 35, height: 35)
                Spacer(minLength: 0)
            }
            .padding()
            Rectangle()
                .frame(width: width, height: 1)
                .foregroundColor(.gray)
                .opacity(0.3)
        }//:VS
        .background(.white)
    }
}

