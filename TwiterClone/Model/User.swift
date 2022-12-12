//
//  User.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 12.12.22.
//

import Foundation

struct ApiResponse: Decodable{
    var user: User
    var token: String
}
struct User: Decodable, Identifiable {
    var _id: String
    
    var id: String{
        return _id
    }
    
    let username: String
    let name: String
    let email: String
    let location: String?
    let bio: String?
    let website: String?
    let avatarExists: String?
    let followers: [String]
    let followings: [String]
}
