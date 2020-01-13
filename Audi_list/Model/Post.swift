//
//  Post.swift
//  Audi_list
//
//  Created by Kaustubh on 13/01/20.
//  Copyright © 2020 KaustubhtestApp. All rights reserved.
//

import Foundation

struct PostsResponse: Codable{
    var total: Int
    let posts: [Post]?
}

struct Post: Codable {
    var id: String
    var timestamp: String
    var visibility: String?
    var message: String
    var service: Service
    var user: User
    var content: [Content]?
}

struct Service: Codable {
    var id: String
    var name: String?
    var title: String
    var image_url: String
}

struct User: Codable {
    var id: String
    var name: String?
    var image_url: String
}

struct Content: Codable {
    var type: String
//    var text: String
    var media: Media
    var url: String?
    var other: String?
}

struct Media: Codable {
    var id: String
    var name: String?
    var url: String
    var content_type: String
}
