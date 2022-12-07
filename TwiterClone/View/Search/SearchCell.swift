//
//  SearchCell.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 05.12.22.
//

import SwiftUI

struct SearchCell: View {
    var tag:String = ""
    var tweets:String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Hello")
                .fontWeight(.heavy)
                .foregroundColor(.white)
            Text(tweets + " Tweets")
                .fontWeight(.light)
                .foregroundColor(.white)
                .background(.green)
        }
    }
}

struct SearchCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchCell()
    }
}
