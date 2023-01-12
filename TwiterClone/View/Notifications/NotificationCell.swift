//
//  NotificationCell.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 05.12.22.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @State var width = UIScreen.main.bounds.width
    
    let notification: Notification
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: 100, height: 1, alignment: .center)
                .foregroundColor(.gray)
                .opacity(0.3)
            HStack(alignment: .top) {
                Image(systemName: "person.fill")
                    .resizable()
                    .foregroundColor(.blue)
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                VStack(alignment: .leading,spacing: 5, content: {
                    KFImage(URL(string: USER_BYID + "\(notification.notSenderId)/avatar"))
                        .placeholder {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 36, height: 36)
                                .cornerRadius(18)
                        }
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                        .cornerRadius(18)
                    
                    Text("\(notification.username)")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Text(notification.notificationType.rawValue == "follow" ? NotificationType.follow.notificationMessage : NotificationType.like.notificationMessage)
                        .foregroundColor(.blue)
                })//:VS
                Spacer(minLength: 0)
            }//:HS
            .padding(.leading, 35)
            
        }//: OVS
    }
}

