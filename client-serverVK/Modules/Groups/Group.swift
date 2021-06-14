//
//  Groups.swift
//  client-serverVK
//
//  Created by Denis Kazarin on 06.06.2021.
//

import Foundation
import RealmSwift

class Group: Object, Codable {
    @objc dynamic var groupName = ""
    @objc dynamic var groupAvatar = ""
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: GroupsResponseKeys.self)
        let itemsValues = try values.nestedContainer(keyedBy: GroupItemsKeys.self, forKey: .items)
        self.groupName = try itemsValues.decode(String.self, forKey: .groupName)
        self.groupAvatar = try itemsValues.decode(String.self, forKey: .groupAvatar)
        
    }
    
    enum GroupsResponseKeys: String, CodingKey {
        case items = "items"
    }
    
    enum GroupItemsKeys: String, CodingKey {
        case groupName = "name"
        case groupAvatar = "photo_100"
    }
}

struct GroupsRequestAnswer: Codable {
    let groupsRequestAnswer: GroupsList
}

struct GroupsList: Codable {
    let groupsList: [Group]
}

