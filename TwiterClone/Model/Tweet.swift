//
//  Tweet.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 13.12.22.
//

import SwiftUI

struct Tweet: Identifiable, Decodable{
    let _id:String
    var id: String{
        return _id
    }
    
    let text: String
    let userId: String
    let username: String
    let user: String
    let image: String?
    var likes: [String]
    var didLike: Bool? = false
    
    
}
