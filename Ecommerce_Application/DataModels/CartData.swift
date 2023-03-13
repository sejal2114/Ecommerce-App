//
//  CartData.swift
//  Ecommerce_Application
//
//  Created by Sejal on 09/03/23.
//

import Foundation
struct Root: Decodable {
    let carts: [Cart]
    let total, skip, limit: Int
}

struct Cart: Decodable {
    let id: Int
    let products: [Product]
    let total, discountedTotal, userID, totalProducts: Int
    let totalQuantity: Int

    enum CodingKeys: String, CodingKey {
        case id, products, total, discountedTotal
        case userID = "userId"
        case totalProducts, totalQuantity
    }
}
struct Product: Decodable {
    let id: Int
    let title: String
    let price, quantity, total: Int
    let discountPercentage: Double
    let discountedPrice: Int
}
