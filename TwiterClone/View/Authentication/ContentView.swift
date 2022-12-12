//
//  ContentView.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 12.12.22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if viewModel.isAuthenticated{
            if let user = viewModel.curretnUser{
                MainView(user: user)
            }
        }else{
            WelcomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
