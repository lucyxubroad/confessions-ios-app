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
    
    private static let likeEndpointBase = commentsEndpointBase
    private static let likeEndpointKeyword = "/vote/"
    private static let likeEndpointOutline = "http://35.231.241.252/api/post/{id}/vote/"
    
    private static let registerUserEndpoint = "http://35.231.241.252/register/"
    
    private static let loginUserEndpoint = "http://35.231.241.252/login/"
    
    
    static func getPosts(completion: @escaping ([Post]) -> Void) {
        Alamofire.request(postsEndpoint, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
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
    
    static func likePost(postId: Int, completion: @escaping (Post) -> Void) {
        let likeEndpoint = "\(likeEndpointBase)\(postId)\(likeEndpointKeyword)"
//        print("likeEndpoint: \(likeEndpoint)")
        let parameters: [String: Any] = [
            "vote": true
        ]
        Alamofire.request(likeEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { (response) in
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
//        print("commentsEndpoint: \(commentsEndpoint)")
        Alamofire.request(commentsEndpoint, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
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
    
    static func registerUser(email: String, password: String, completion: @escaping (RegisterUserResponse) -> Void) {
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        Alamofire.request(registerUserEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let postResponse = try? jsonDecoder.decode(RegisterUserResponse.self, from: data) {
                    completion(postResponse)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print("There was an error!")
                print(error.localizedDescription)
            }
        }
    }
    
    static func loginUser(email: String, password: String, completion: @escaping (RegisterUserResponse) -> Void) {
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        Alamofire.request(loginUserEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let postResponse = try? jsonDecoder.decode(RegisterUserResponse.self, from: data) {
                    completion(postResponse)
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
