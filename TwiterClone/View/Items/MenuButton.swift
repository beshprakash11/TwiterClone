//
//  MenuItem.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 07.12.22.
//

import SwiftUI

struct MenuButton: View {
    var title: String
    var body: some View {
        HStack(spacing: 15, content: {
            Image(title)
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .foregroundColor(.gray)
            Text(title)
                .foregroundColor(.blue)
            Spacer(minLength: 0)
            
        })
        .padding(.vertical, 12)
    }
}

/*
struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton()
    }
}
*/
