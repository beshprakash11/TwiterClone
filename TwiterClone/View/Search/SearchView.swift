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
    
    @ObservedObject var viewModel = SSearchViewModel()
    var body: some View {
        VStack{            
            ScrollView{
                SearchBar(text: $text, isEditing: $isEditing)
                    .padding(.horizontal)
                
                LazyVStack{
                    ForEach(self.viewModel.user){user in
                        SearchUserCell(user: user)
                            .padding(.leading)
                    }
                    
                }
            }//SV
        }//VS
    }
}
