//
//  Messages.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 25.11.22.
//

import SwiftUI

struct MessagesView: View {
    var body: some View {
        VStack{
            ScrollView{
                ForEach(0..<9){_ in
                    MessageCell()
                }
            }//:SV
        }//:VS
    }
}

struct Messages_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
