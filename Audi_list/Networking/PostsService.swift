//
//  PostsService.swift
//  Audi_list
//
//  Created by Kaustubh on 13/01/20.
//  Copyright © 2020 KaustubhtestApp. All rights reserved.
//

import Foundation

class PostsService {
    
    private let client = NetworkEngine(baseUrl: "https://aev-home-task.apps.emea.vwapps.io/v1")
    
    @discardableResult
    func loadPosts(offset: Int, limit: Int, completion: @escaping ([Post]?, CustomError?) -> ()) -> URLSessionDataTask? {
        let params: JSON = ["page.offset": offset, "page.limit": limit]
        
        return client.load(path: "/community/v1/posts", method: .get, params: params) { result, error in
            if (error != nil) {
                completion(nil, error)
            }
            else if (result != nil) {
                let postResponse = try! JSONDecoder().decode(PostsResponse.self, from: result as! Data)
                completion(postResponse.posts, nil)
            }
            else {
                completion(nil, CustomError(code: 405, type: "NoResult", message: "No results found"))
            }
        }
    }
}
