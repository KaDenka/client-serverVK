//
//  Groups.swift
//  client-serverVK
//
//  Created by Denis Kazarin on 06.06.2021.
//

import Foundation
import RealmSwift

// MARK: - Groups
class Groups: Object, Codable {
    @objc dynamic let response: Answer
}

// MARK: - Answer
class Answer: Object, Codable {
    @objc dynamic let count: Int
    @objc dynamic let items: List<GroupElement>
}

// MARK: - GroupElement
class GroupElement: Object, Codable {
    @objc dynamic let id: Int
    @objc dynamic let name, screenName: String
    @objc dynamic let isClosed: Int
    @objc dynamic let type: String
    @objc dynamic let isAdmin, isMember, isAdvertiser: Int
    @objc dynamic let photo50, photo100, photo200: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case type
        case isAdmin = "is_admin"
        case isMember = "is_member"
        case isAdvertiser = "is_advertiser"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }
}
