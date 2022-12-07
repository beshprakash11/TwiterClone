//
//  FollowView.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 06.12.22.
//

import SwiftUI

struct FollowView: View {
    var count: Int
    var title: String
    var body: some View {
        HStack{
            Text("\(count)")
                .fontWeight(.bold)
                .foregroundColor(.blue)
            Text(title)
                .foregroundColor(.gray)
        }//:OS_HS
    }
}

