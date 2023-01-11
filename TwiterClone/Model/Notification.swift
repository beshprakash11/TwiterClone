//
//  Notification.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 11.01.23.
//

import Foundation

struct Notification: Decodable, Identifiable {
    var _id: String
    var id: String{
        return _id
    }
    
    var username: String
    var notSenderId: String
    var notReceiverId: String
    var postText: String?
    
    var notificationType: NotificationType
}

enum NotificationType: String, Decodable {
    case like = "like"
    case follow = "follow"
    
    var notificationMessage: String {
        switch self{
        case .like: return "liked your Tweet"
        case .follow: return "followed you"
        }
    }
}
