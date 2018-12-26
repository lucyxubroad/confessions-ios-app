//
//  User.swift
//  ConfessionsDynamicApp
//
//  Created by Lucy Xu on 12/25/18.
//  Copyright © 2018 Lucy Xu. All rights reserved.
//

import Foundation

struct RegisterUserResponse: Codable {
    var session_token: String
    var session_expiration: String
    var update_token: String
    var user_id: Int
    var photo_id: Int
}

class User {
    
    var user_id: Int
    var photo_id: Int
    var username: String
    
    init(user_id: Int, photo_id: Int) {
        self.user_id = user_id
        self.photo_id = photo_id
        self.username = "Anonymous #\(user_id)"
    }
}

//struct Comment1edResponse: Codable {
//    var data: Comment1
//}
//
//struct Comment1Response: Codable {
//    var data: [Comment1]
//}
//
//struct Comment1: Codable {
//    var id: Int
//    var score: Int
//    var text: String
//    var username: String
//}
