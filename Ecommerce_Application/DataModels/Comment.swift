//
//  Comment.swift
//  Ecommerce_Application
//
//  Created by Sejal on 13/03/23.
//

import Foundation
struct Comment: Decodable {
    let comments: [CommentElement]
}
struct CommentElement: Decodable {
    let id: Int
    let body: String
    let postID: Int
    let user: User

    enum CodingKeys: String, CodingKey {
        case id, body
        case postID = "postId"
        case user
    }
}

struct User: Decodable {
    let id: Int
    let username: String
}
