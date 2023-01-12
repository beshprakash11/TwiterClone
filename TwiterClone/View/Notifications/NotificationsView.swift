//
//  NotificationsView.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 25.11.22.
//

import SwiftUI

struct NotificationsView: View {
    let user: User
    @ObservedObject var viewModel: NotificationViewModel
    
    init(user: User) {
        self.user = user
        self.viewModel = NotificationViewModel(user: user)
    }
    var body: some View {
        VStack{
            ScrollView{
                ForEach(viewModel.notifications){not in
                    NotificationCell(notification: not)
                }
            }//:SV
        }//:VS
    }
}
