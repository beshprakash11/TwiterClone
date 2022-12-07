//
//  SearchView.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 25.11.22.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    @State var isEditing = true
    var body: some View {
        VStack{
            SearchBar(text: $text, isEditing: $isEditing)
                .padding(.horizontal)
            if !isEditing{
                VStack{
                    List(0..<9){i in
                        SearchCell(tag: "Hello", tweets: String(i))
                    }
                }
            }else{
                List(0..<9){_ in
                    SearchUserCell()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
