//
//  PostData.swift
//  Ecommerce_Application
//
//  Created by Sejal on 13/03/23.
//

import Foundation
struct PostData: Decodable {
    let posts: [Post]
    let total, skip, limit: Int
}
struct Post: Decodable {
    let id: Int
    let title, body: String
    let userID: Int
    let tags: [String]
    let reactions: Int

    enum CodingKeys: String, CodingKey {
        case id, title, body
        case userID = "userId"
        case tags, reactions
    }
}
