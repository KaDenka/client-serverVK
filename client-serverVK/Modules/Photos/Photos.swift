//
//  Photos.swift
//  client-serverVK
//
//  Created by Denis Kazarin on 06.06.2021.
//

import Foundation
import RealmSwift

// MARK: - Photos
class Photos: Object, Codable {
    @objc dynamic let response: Collection

    init(response: Collection) {
        self.response = response
    }
}

// MARK: - Collection
class Collection: Object, Codable {
    @objc dynamic let count: Int
    @objc dynamic let items: [Item]

    init(count: Int, items: [Item]) {
        self.count = count
        self.items = items
    }
}

// MARK: - Item
class Item: Object, Codable {
    @objc dynamic let albumID, id, date: Int
    @objc dynamic let text: String
    @objc dynamic let sizes: [Photo]
    @objc dynamic let hasTags: Bool
    @objc dynamic let ownerID: Int
    @objc dynamic let lat, long: Double

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id, date, text, sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
        case lat, long
    }

    init(albumID: Int, id: Int, date: Int, text: String, sizes: [Photo], hasTags: Bool, ownerID: Int, lat: Double, long: Double) {
        self.albumID = albumID
        self.id = id
        self.date = date
        self.text = text
        self.sizes = sizes
        self.hasTags = hasTags
        self.ownerID = ownerID
        self.lat = lat
        self.long = long
    }
}

// MARK: - Photo
class Photo: Object, Codable {
    @objc dynamic let width, height: Int
    @objc dynamic let url: String
    @objc dynamic let type: String
    
    init (width: Int, height: Int, url: String, type: String) {
        self.width = width
        self.height = height
        self.url = url
        self.type = type
    }
}




//// MARK: - Photos
//struct Photos: Codable {
//    let response: Collection
//}
//
//// MARK: - Collection
//struct Collection: Codable {
//    let count: Int
//    let items: [Item]
//}
//
//// MARK: - Item
//struct Item: Codable {
//    let albumID, id, date: Int
//    let text: String
//    let sizes: [Photo]
//    let hasTags: Bool
//    let ownerID: Int
//    let lat, long: Double?
//
//    enum CodingKeys: String, CodingKey {
//        case albumID = "album_id"
//        case id, date, text, sizes
//        case hasTags = "has_tags"
//        case ownerID = "owner_id"
//        case lat, long
//    }
//}
//
//// MARK: - Photo
//struct Photo: Codable {
//    let width, height: Int
//    let url: String
//    let type: String
//}
