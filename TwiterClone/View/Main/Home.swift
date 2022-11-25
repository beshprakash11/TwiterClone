//
//  Home.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 25.11.22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            ZStack{
                TabView{
                    Feed()
                        .tabItem {
                            Image("Home")
                        }
                    SearchView()
                        .tabItem{Image("Search")}
                    NotificationsView()
                        .tabItem{Image("Notifications")}
                    MessagesView()
                        .tabItem{Image("Messages")}
                }//:TabView
            }//:ZStack
        }//:VStack
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
