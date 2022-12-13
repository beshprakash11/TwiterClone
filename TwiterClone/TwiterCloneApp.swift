//
//  TwiterCloneApp.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 25.11.22.
//

import SwiftUI

@main
struct TwiterCloneApp: App {
    init(){
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    var body: some Scene {
        WindowGroup {
            /*
            //ContentView()
            //Home()
            //CreateTweetView()
            //MainView()
            //SlideMenu()
            //UserProfile()
            //WelcomeView()
            //RegisterView()
            //LoginView()*/
            ContentView().environmentObject(AuthViewModel.shared)
            
        }
    }
}
