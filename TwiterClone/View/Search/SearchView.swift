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
    
    var users: [User] {
        return text.isEmpty ? viewModel.user : viewModel.filterUsers(text)
    }
    
    @ObservedObject var viewModel = SSearchViewModel()
    var body: some View {
        VStack{
            ScrollView{
                SearchBar(text: $text, isEditing: $isEditing)
                    .padding(.horizontal)
                
                LazyVStack{
                    ForEach(self.users){user in
                        NavigationLink(destination: UserProfile(user: user)) {
                            SearchUserCell(user: user)
                                .padding(.leading)
                        }
                    }                    
                }
            }//SV
        }//VS
    }
}
