//
//  MainView.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 06.12.22.
//

import SwiftUI

struct MainView: View {
    let user: User
    @State var width = UIScreen.main.bounds.width - 90
    @State var x = -UIScreen.main.bounds.width + 90
    var body: some View {
        NavigationView{
            //MARK: Main view
            VStack{
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                    VStack {
                        TapBar(x: $x)
                        Home()
                    }
                    .offset(x: x + width)
                    SlideMenu()
                        .shadow(color: Color.black.opacity(x != 0 ? 0.1 : 0),radius: 5, x: 5.0, y: 0)
                        .offset(x: x)
                        .background(Color.black.opacity(x == 0 ? 0.5 : 0))
                        .ignoresSafeArea(.all, edges: .vertical)
                        .onTapGesture {
                            withAnimation {
                                x = -width //when tap width is -ve and hide from the view
                            }
                        }
                })
                .gesture(DragGesture().onChanged({ (value) in
                    //Use to drag the side menu
                    if value.translation.width > 0{
                        if x < 0 {
                            // side is hidden
                            x = -width + value.translation.width
                        }
                    }else{
                        if x != -width{
                            x = value.translation.width
                        }
                    }
                }).onEnded({ (value) in
                    withAnimation {
                        if -x < width / 2{
                            x = 0
                        }else{
                            x = -width
                        }
                    }
                }))
            }//:Main View
            .navigationBarHidden(true)
            .navigationTitle("")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

