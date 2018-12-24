//
//  Post.swift
//  ConfessionsDynamicApp
//
//  Created by Lucy Xu on 12/24/18.
//  Copyright © 2018 Lucy Xu. All rights reserved.
//

import Foundation

struct PostedResponse: Codable {
    var data: Post
}

struct PostResponse: Codable {
    var data: [Post]
}

//struct PostsDataResponse: Codable {
//    var posts: [Post]
//}

struct Post: Codable {
    var id: Int
    var score: Int
    var text: String
    var comment_count: Int
    var username: String
    var longitude: Float
    var latitude: Float
}
