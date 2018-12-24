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
}
