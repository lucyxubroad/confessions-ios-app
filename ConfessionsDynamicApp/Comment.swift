//
//  Comment.swift
//  ConfessionsDynamicApp
//
//  Created by Lucy Xu on 12/24/18.
//  Copyright © 2018 Lucy Xu. All rights reserved.
//

import Foundation

class Comment {
    
    var id: Int
    var score: Int
    var text: String
    var username: String
    
    init(id: Int, score: Int, text: String, username: String) {
        self.id = id
        self.score = score
        self.username = username
        self.text = text
    }
}

struct Comment1edResponse: Codable {
    var data: Comment1
}

struct Comment1Response: Codable {
    var data: [Comment1]
}

struct Comment1: Codable {
    var id: Int
    var score: Int
    var text: String
    var username: String
}
