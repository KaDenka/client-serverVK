//
//  Friends.swift
//  client-serverVK
//
//  Created by Denis Kazarin on 06.06.2021.
//

import Foundation
import RealmSwift

class Friend: Object, Codable {
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var avatarPhoto = ""
    
    enum FriendsResponseKeys: String, CodingKey {
        case items = "items"
    }
    
    enum FriendsItemsKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarPhoto = "photo_50"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: FriendsResponseKeys.self)
        let itemsValues = try values.nestedContainer(keyedBy: FriendsItemsKeys.self, forKey: .items)
        self.firstName = try itemsValues.decode(String.self, forKey: .firstName)
        self.lastName = try itemsValues.decode(String.self, forKey: .lastName)
        self.avatarPhoto = try itemsValues.decode(String.self, forKey: .avatarPhoto)
    }
    
    func updateFriendsInRealm(friends: [Friend]) {
        let realm = try! Realm()
        try? realm.write {
            realm.add(friends)
        }
    }
    
    func loadFriendsFromRealm() -> [Friend] {
        do {
            let realm = try Realm()
            let friends = [Friend](realm.objects(Friend.self))
            return friends
        } catch {
            print(error)
        }
        
        return [Friend]()
    }
}

struct FriendsRequestAnswer: Codable {
    let friendsRequestAnswer: FriendsResponse
}

struct FriendsResponse: Codable {
    let friendsList: [Friend]
}
