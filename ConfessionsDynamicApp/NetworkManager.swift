//
//  NetworkManager.swift
//  ConfessionsDynamicApp
//
//  Created by Lucy Xu on 12/24/18.
//  Copyright © 2018 Lucy Xu. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    private static let endpointBase = "http://35.231.241.252/"
    private static let postsEndpoint = "http://35.231.241.252/api/posts/"
    
    private static let commentsEndpointBase = "http://35.231.241.252/api/post/"
    private static let commentsGetEndpointKeyword = "/comments/"
    private static let commentsPostEndpointKeyword = "/comment/"
    private static let commentsEndpointOutline = "http://35.231.241.252/api/post/{id}/comments/"
    
    
    static func getPosts(completion: @escaping ([Post]) -> Void) {
        Alamofire.request(postsEndpoint, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let postResponse = try? jsonDecoder.decode(PostResponse.self, from: data) {
                    completion(postResponse.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func createPost(text: String, completion: @escaping (Post) -> Void) {
        let parameters: [String: Any] = [
            "text": text,
            "username": "Anonymous #1231",
            "longitude": -45.453449,
            "latitude": -76.473503
        ]
        
        Alamofire.request(postsEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let postResponse = try? jsonDecoder.decode(PostedResponse.self, from: data) {
                    completion(postResponse.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print("There was an error!")
                print(error.localizedDescription)
            }
        }
    }
    
    static func getComments(postId: Int, completion: @escaping ([Comment1]) -> Void) {
        let commentsEndpoint = "\(commentsEndpointBase)\(postId)\(commentsGetEndpointKeyword)"
        print("commentsEndpoint: \(commentsEndpoint)")
        Alamofire.request(commentsEndpoint, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let postResponse = try? jsonDecoder.decode(Comment1Response.self, from: data) {
                    completion(postResponse.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func createComment(postId: Int, text: String, completion: @escaping (Comment1) -> Void) {
        let commentsEndpoint = "\(commentsEndpointBase)\(postId)\(commentsPostEndpointKeyword)"
        print("Making comment POST to \(commentsEndpoint)")
        let parameters: [String: Any] = [
            "text": text,
            "username": "Anonymous #1231"
        ]
        Alamofire.request(commentsEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let postResponse = try? jsonDecoder.decode(Comment1edResponse.self, from: data) {
                    completion(postResponse.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print("There was an error!")
                print(error.localizedDescription)
            }
        }
    }
}
