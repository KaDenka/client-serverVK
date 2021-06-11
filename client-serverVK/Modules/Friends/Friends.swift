//
//  Friends.swift
//  client-serverVK
//
//  Created by Denis Kazarin on 06.06.2021.
//

import Foundation
import RealmSwift

// MARK: - Friends
class Friends: Codable {
    let response: Response
    
    init(response: Response) {
        self.response = response
    }
}

// MARK: - Response
class Response: Codable {
    let count: Int
    let items: [User]
    
    init(count: Int, items: [User]) {
        self.count = count
        self.items = items
    }
}

// MARK: - User
class User: Codable {
    let firstName: String
    let id: Int
    let lastName: String
    let canAccessClosed, isClosed: Bool
    let photo50: String
    let online: Int
    let nickname, trackCode: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id
        case lastName = "last_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
        case photo50 = "photo_50"
        case online, nickname
        case trackCode = "track_code"
    }
    
    init(firstName: String, id: Int, lastName: String, canAccessClosed: Bool, isClosed: Bool, photo50: String, online: Int, nickname: String, trackCode: String) {
        self.firstName = firstName
        self.id = id
        self.lastName = lastName
        self.canAccessClosed = canAccessClosed
        self.isClosed = isClosed
        self.photo50 = photo50
        self.online = online
        self.nickname = nickname
        self.trackCode = trackCode
    }
}


//// MARK: - Friends
//struct Friends: Codable {
//    let response: Response
//}
//
//// MARK: - Response
//struct Response: Codable {
//    let count: Int
//    let items: [User]
//}
//
//// MARK: - User
//struct User: Codable {
//    let canAccessClosed: Bool
//    let online, id: Int
//    let nickname, lastName: String
//    let photo50: String
//    let trackCode: String
//    let isClosed: Bool
//    let firstName: String
//
//    enum CodingKeys: String, CodingKey {
//        case canAccessClosed = "can_access_closed"
//        case online, id, nickname
//        case lastName = "last_name"
//        case photo50 = "photo_50"
//        case trackCode = "track_code"
//        case isClosed = "is_closed"
//        case firstName = "first_name"
//    }
//}
