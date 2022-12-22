//
//  ProfileViewModel.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 22.12.22.
//

import SwiftUI

class ProfileViewModel: ObservableObject{
    @Published var user: User
    
    init(user: User){
        self.user = user
    }
    
    
}
