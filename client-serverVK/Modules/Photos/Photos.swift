//
//  Photos.swift
//  client-serverVK
//
//  Created by Denis Kazarin on 06.06.2021.
//

import Foundation

// MARK: - Photos
struct Photos: Codable {
    let response: Collection
}

// MARK: - Collection
struct Collection: Codable {
    let count: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let albumID, id, date: Int
    let text: String
    let sizes: [Photo]
    let hasTags: Bool
    let ownerID: Int
    let lat, long: Double?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id, date, text, sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
        case lat, long
    }
}

// MARK: - Photo
struct Photo: Codable {
    let width, height: Int
    let url: String
    let type: String
}
