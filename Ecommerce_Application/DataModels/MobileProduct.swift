//
//  ProductData.swift
//  Ecommerce_Application


import Foundation
struct MobileData: Codable {
    let products: [Mobile]
    let total, skip, limit: Int
}

struct Mobile: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
